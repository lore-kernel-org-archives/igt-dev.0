Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA32B6E079
 for <igt-dev@lists.freedesktop.org>; Fri,  7 May 2021 13:19:31 +0000 (UTC)
From: Nischal Varide <nischal.varide@intel.com>
Date: Fri,  7 May 2021 11:57:00 +0530
Message-Id: <20210507062700.23126-2-nischal.varide@intel.com>
In-Reply-To: <20210507062700.23126-1-nischal.varide@intel.com>
References: <20210506004719.4121-2-nischal.varide@intel.com>
 <20210507062700.23126-1-nischal.varide@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC v2 1/1] drm/i915/display: New Property Creation for
 HDMI
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, nischal.varide@intel.com, uma.shankar@intel.com, ankit.k.nautiyal@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Right now the HDMI properties like vendor and product ids are hardcoded
in the function "intel_hdmi_compute_spd_infoframe()".

ret = hdmi_spd_infoframe_init(frame, "Intel", "Integrated gfx").

This patch enables the possibility of setting vendor and product id fields
of the Infoframe structure in the userspace instead of hardcoding in
the kernel, and this will help display manufacturers preload picture
configurations for the devices.

The changes has been tested by an IGT testcase which got floated.

v2: Edited the commit message on comments received (Ville, Jani)
v1: Create new property for vendor and product id of HDMI.

Signed-off-by: Nischal Varide <nischal.varide@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c   | 14 +++++++++++++
 .../gpu/drm/i915/display/intel_connector.c    | 20 +++++++++++++++++++
 .../gpu/drm/i915/display/intel_connector.h    |  1 +
 .../drm/i915/display/intel_display_types.h    |  5 +++++
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 14 ++++++++++++-
 drivers/gpu/drm/i915/display/intel_hdmi.h     |  5 +++++
 drivers/gpu/drm/i915/i915_drv.h               |  1 +
 7 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 45feaaddab26..4d38eeb9dd33 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -65,6 +65,9 @@ int intel_digital_connector_atomic_get_property(struct drm_connector *connector,
 		*val = intel_conn_state->force_audio;
 	else if (property == dev_priv->broadcast_rgb_property)
 		*val = intel_conn_state->broadcast_rgb;
+	else if (property ==  dev_priv->hdmi_vendor_product_property)
+		*val = (intel_conn_state->hdmi_vendor_product_blob)
+			? (intel_conn_state->hdmi_vendor_product_blob->base.id) : 0;
 	else {
 		drm_dbg_atomic(&dev_priv->drm,
 			       "Unknown property [PROP:%d:%s]\n",
@@ -93,6 +96,7 @@ int intel_digital_connector_atomic_set_property(struct drm_connector *connector,
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_digital_connector_state *intel_conn_state =
 		to_intel_digital_connector_state(state);
+	struct drm_property_blob *new_blob = NULL;
 
 	if (property == dev_priv->force_audio_property) {
 		intel_conn_state->force_audio = val;
@@ -104,6 +108,16 @@ int intel_digital_connector_atomic_set_property(struct drm_connector *connector,
 		return 0;
 	}
 
+	if (property ==  dev_priv->hdmi_vendor_product_property) {
+		new_blob = drm_property_lookup_blob(dev, val);
+		if (new_blob == NULL)
+			return -EINVAL;
+		if (drm_property_replace_blob
+			(&intel_conn_state->hdmi_vendor_product_blob, new_blob)) {
+			drm_property_blob_put(new_blob);
+			return 0;
+		}
+	}
 	drm_dbg_atomic(&dev_priv->drm, "Unknown property [PROP:%d:%s]\n",
 		       property->base.id, property->name);
 	return -EINVAL;
diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index d5ceb7bdc14b..c4ce8f70e752 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -269,6 +269,26 @@ intel_attach_broadcast_rgb_property(struct drm_connector *connector)
 	drm_object_attach_property(&connector->base, prop, 0);
 }
 
+void
+intel_attach_hdmi_vendor_product_property(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct drm_property *prop;
+
+	prop = dev_priv->hdmi_vendor_product_property;
+	if (!prop) {
+		prop = drm_property_create(dev, DRM_MODE_PROP_BLOB |
+			DRM_MODE_PROP_ATOMIC, "hdmi_vendor_product", 0);
+		if (!prop)
+			return;
+
+		dev_priv->hdmi_vendor_product_property = prop;
+	}
+
+	drm_object_attach_property(&connector->base, prop, 0);
+}
+
 void
 intel_attach_aspect_ratio_property(struct drm_connector *connector)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_connector.h b/drivers/gpu/drm/i915/display/intel_connector.h
index 661a37a3c6d8..9e16e098f53a 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.h
+++ b/drivers/gpu/drm/i915/display/intel_connector.h
@@ -27,6 +27,7 @@ enum pipe intel_connector_get_pipe(struct intel_connector *connector);
 int intel_connector_update_modes(struct drm_connector *connector,
 				 struct edid *edid);
 int intel_ddc_get_modes(struct drm_connector *c, struct i2c_adapter *adapter);
+void intel_attach_hdmi_vendor_product_property(struct drm_connector *connector);
 void intel_attach_force_audio_property(struct drm_connector *connector);
 void intel_attach_broadcast_rgb_property(struct drm_connector *connector);
 void intel_attach_aspect_ratio_property(struct drm_connector *connector);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 6d8cdaa36748..d29f54163044 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -549,6 +549,11 @@ struct intel_digital_connector_state {
 
 	enum hdmi_force_audio force_audio;
 	int broadcast_rgb;
+	/*
+	 * hdmi_infoframe metadata
+	 * DRM blob with hdmi vendor and product info
+	 */
+	struct drm_property_blob *hdmi_vendor_product_blob;
 };
 
 #define to_intel_digital_connector_state(x) container_of(x, struct intel_digital_connector_state, base)
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 28e297296160..6bda096b411d 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -762,6 +762,9 @@ intel_hdmi_compute_spd_infoframe(struct intel_encoder *encoder,
 {
 	struct hdmi_spd_infoframe *frame = &crtc_state->infoframes.spd.spd;
 	int ret;
+	struct hdmi_vendor_product_info *hdmi_vp_info;
+	struct intel_digital_connector_state *intel_conn_state =
+		to_intel_digital_connector_state(conn_state);
 
 	if (!crtc_state->has_infoframe)
 		return true;
@@ -769,7 +772,15 @@ intel_hdmi_compute_spd_infoframe(struct intel_encoder *encoder,
 	crtc_state->infoframes.enable |=
 		intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_SPD);
 
-	ret = hdmi_spd_infoframe_init(frame, "Intel", "Integrated gfx");
+	if (!intel_conn_state->hdmi_vendor_product_blob) {
+		ret = hdmi_spd_infoframe_init(frame, "intel", "Integrated gfx");
+	} else {
+		if (intel_conn_state->hdmi_vendor_product_blob->data) {
+			hdmi_vp_info = intel_conn_state->hdmi_vendor_product_blob->data;
+			ret = hdmi_spd_infoframe_init(frame, hdmi_vp_info->vendor,
+					hdmi_vp_info->product);
+		}
+	}
 	if (drm_WARN_ON(encoder->base.dev, ret))
 		return false;
 
@@ -2456,6 +2467,7 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *c
 	intel_attach_force_audio_property(connector);
 	intel_attach_broadcast_rgb_property(connector);
 	intel_attach_aspect_ratio_property(connector);
+	intel_attach_hdmi_vendor_product_property(connector);
 
 	intel_attach_hdmi_colorspace_property(connector);
 	drm_connector_attach_content_type_property(connector);
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index b43a180d007e..5be7179389d1 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -23,6 +23,11 @@ struct drm_connector_state;
 union hdmi_infoframe;
 enum port;
 
+/*Vendor Id and Product Id for the Hdmi property exported to Userspace*/
+struct hdmi_vendor_product_info {
+	char vendor[30];
+	char product[30];
+};
 void intel_hdmi_init_connector(struct intel_digital_port *dig_port,
 			       struct intel_connector *intel_connector);
 int intel_hdmi_compute_config(struct intel_encoder *encoder,
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 3cfa6effbb5f..9e3373c0f1eb 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1014,6 +1014,7 @@ struct drm_i915_private {
 
 	struct drm_property *broadcast_rgb_property;
 	struct drm_property *force_audio_property;
+	struct drm_property *hdmi_vendor_product_property;
 
 	/* hda/i915 audio component */
 	struct i915_audio_component *audio_component;
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
