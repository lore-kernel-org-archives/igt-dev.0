Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 15 Nov 2021 15:17:47 +0530
Message-Id: <20211115094759.520955-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 02/14] lib/igt_kms: Add plane color mgmt properties
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Add support for Plane color management properties.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 5 +++++
 lib/igt_kms.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 34a2aa00ea..fdb83e0f91 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -581,6 +581,11 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_ALPHA] = "alpha",
 	[IGT_PLANE_ZPOS] = "zpos",
 	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
+	[IGT_PLANE_CTM] = "PLANE_CTM",
+	[IGT_PLANE_GAMMA_MODE] = "PLANE_GAMMA_MODE",
+	[IGT_PLANE_GAMMA_LUT] = "PLANE_GAMMA_LUT",
+	[IGT_PLANE_DEGAMMA_MODE] = "PLANE_DEGAMMA_MODE",
+	[IGT_PLANE_DEGAMMA_LUT] = "PLANE_DEGAMMA_LUT",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e9ecd21e98..3a1f7243ad 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -301,6 +301,11 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_ALPHA,
        IGT_PLANE_ZPOS,
        IGT_PLANE_FB_DAMAGE_CLIPS,
+       IGT_PLANE_CTM,
+       IGT_PLANE_GAMMA_MODE,
+       IGT_PLANE_GAMMA_LUT,
+       IGT_PLANE_DEGAMMA_MODE,
+       IGT_PLANE_DEGAMMA_LUT,
        IGT_NUM_PLANE_PROPS
 };
 
-- 
2.32.0
