Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356CC10E0B1
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Oct 2022 18:55:34 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id
 n13-20020a05620a294d00b006cf933c40feso10440774qkp.20
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Oct 2022 11:55:31 -0700 (PDT)
Message-ID: <60afcb4f2f4d78eee291beb3a316b6dadd8f8989.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Mark Yacoub <markyacoub@chromium.org>, igt-dev@lists.freedesktop.org
Date: Mon, 17 Oct 2022 14:55:28 -0400
In-Reply-To: <20220923200504.1291737-1-markyacoub@chromium.org>
References: <20220923200504.1291737-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] Chamelium: Handle getting port connector if
 it's MST.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, petri.latvala@intel.com, markyacoub@google.com,
 seanpaul@chromium.org, ihf@google.com, matthewtlam@google.com,
 khaled.almahallawy@intel.com, amstan@chromium.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2022-09-23 at 16:05 -0400, Mark Yacoub wrote:
> [Why]
> When getting a connector for a port, the connector ID might be invalid
> after a replug if it's an MST connector. Getting the connector with just
> the connector ID will not always work.
> 
> [How]
> Check if the connector is MST by checking the port's connector path.
> If it is, iterate through all connectors until a connector with a
> matching path is found.
> 
> TEST=./kms_chamelium --run-subtest dp-hpd [on intel Volteer board with
> Chamelium V3 connected]
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  lib/igt_chamelium.c | 107 +++++++++++++++++++++++++++++++++++---------
>  lib/igt_kms.c       |  16 +++++++
>  lib/igt_kms.h       |   1 +
>  3 files changed, 102 insertions(+), 22 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 0fee8a83..26244bd5 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -182,6 +182,20 @@ unsigned int chamelium_port_get_type(const struct chamelium_port *port) {
>  	return port->type;
>  }
>  
> +/**
> + * chamelium_port_get_name:
> + * @port: The chamelium port to retrieve the name of
> + *
> + * Gets the name of the DRM connector corresponding to the given Chamelium
> + * port.
> + *
> + * Returns: the name of the DRM connector
> + */
> +const char *chamelium_port_get_name(struct chamelium_port *port)
> +{
> +	return port->name;
> +}
> +
>  /**
>   * chamelium_port_get_connector:
>   * @chamelium: The Chamelium instance to use
> @@ -197,30 +211,79 @@ drmModeConnector *chamelium_port_get_connector(struct chamelium *chamelium,
>  					       struct chamelium_port *port,
>  					       bool reprobe)
>  {
> -	drmModeConnector *connector;
> +	typedef drmModeConnectorPtr (*getConnectorPtr)(int fd,
> +						       uint32_t connector_id);
>  
> -	if (reprobe)
> -		connector = drmModeGetConnector(chamelium->drm_fd,
> -						port->connector_id);
> -	else
> -		connector = drmModeGetConnectorCurrent(
> -		    chamelium->drm_fd, port->connector_id);
> +	drmModeRes *res = NULL;
> +	int i;
>  
> -	return connector;
> -}
> +	bool is_mst_port = !!port->connector_path;
> +	getConnectorPtr getConnector = reprobe ? &drmModeGetConnector :
> +						 &drmModeGetConnectorCurrent;
> +	int drm_fd = chamelium->drm_fd;
> +	drmModeConnector *connector = getConnector(drm_fd, port->connector_id);
>  
> -/**
> - * chamelium_port_get_name:
> - * @port: The chamelium port to retrieve the name of
> - *
> - * Gets the name of the DRM connector corresponding to the given Chamelium
> - * port.
> - *
> - * Returns: the name of the DRM connector
> - */
> -const char *chamelium_port_get_name(struct chamelium_port *port)
> -{
> -	return port->name;
> +	/* If the port isn't MST, then the connector ID should be consistent to grab the connector. */
> +	if (!is_mst_port) {
> +		return connector;
> +	}
> +
> +	/* If the port is MST, then we need to find the connector ID from the path. */
> +
> +	/* In case the connector ID is still valid, do a quick check if we're have the connector we expect. 
> +	 * Otherwise, read the new resources and find the new connector we're looking for. */
> +	if (connector) {
> +		drmModePropertyBlobPtr path_blob =
> +			kmstest_get_path_blob(drm_fd, connector->connector_id);
> +		if (path_blob) {
> +			bool is_correct_connector =
> +				strcmp(port->connector_path, path_blob->data) ==
> +				0;
> +			drmModeFreePropertyBlob(path_blob);
> +			if (is_correct_connector)
> +				return connector;
> +		}
> +
> +		drmModeFreeConnector(connector);
> +		connector = NULL;
> +	}
> +
> +	res = drmModeGetResources(drm_fd);
> +	for (i = 0; i < res->count_connectors; i++) {
> +		drmModePropertyBlobPtr path_blob = NULL;
> +
> +		connector = getConnector(drm_fd, res->connectors[i]);
> +		/* Check if the connector is not disconnected and in zombie mode. */
> +		if (!connector)
> +			continue;
> +		/* Check if the connector is MST. */
> +		path_blob =
> +			kmstest_get_path_blob(drm_fd, connector->connector_id);
> +		if (!path_blob)
> +			continue;
> +
> +		if (strcmp(path_blob->data, port->connector_path) == 0) {
> +			char connector_name[50];
> +			/* At finding the connector, update its metadata. */
> +			port->connector_id = connector->connector_id;
> +
> +			snprintf(connector_name, 50, "%s-%u",
> +				 kmstest_connector_type_str(
> +					 connector->connector_type),
> +				 connector->connector_type_id);
> +			port->name = strdup(connector_name);
> +
> +			goto out;
> +		}
> +
> +		drmModeFreePropertyBlob(path_blob);
> +		drmModeFreeConnector(connector);
> +		connector = NULL;
> +	}
> +
> +out:
> +	drmModeFreeResources(res);
> +	return connector;
>  }
>  
>  /**
> @@ -2862,7 +2925,7 @@ struct chamelium *chamelium_init(int drm_fd)
>  		bool type_mismatch = false;
>  		struct chamelium_port * port = &chamelium->ports[i];
>  		drmModeConnectorPtr connector =
> -			drmModeGetConnectorCurrent(drm_fd, port->connector_id);
> +			chamelium_port_get_connector(chamelium, port, false);
>  
>  		igt_assert(connector != NULL);
>  
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 665594aa..55fcd811 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1786,6 +1786,22 @@ bool kmstest_get_connector_config(int drm_fd, uint32_t connector_id,
>  					 config, 0);
>  }
>  
> +drmModePropertyBlobPtr kmstest_get_path_blob(int drm_fd, uint32_t connector_id)
> +{
> +	uint64_t path_blob_id = 0;
> +	drmModePropertyBlobPtr path_blob = NULL;
> +
> +	if (!kmstest_get_property(drm_fd, connector_id,
> +				  DRM_MODE_OBJECT_CONNECTOR, "PATH", NULL,
> +				  &path_blob_id, NULL)) {
> +		return NULL;
> +	}
> +
> +	path_blob = drmModeGetPropertyBlob(drm_fd, path_blob_id);
> +	igt_assert(path_blob);
> +	return path_blob;
> +}
> +
>  /**
>   * kmstest_probe_connector_config:
>   * @drm_fd: DRM fd
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 3d78c37f..eddfb6fc 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -234,6 +234,7 @@ bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
>  bool kmstest_get_connector_config(int drm_fd, uint32_t connector_id,
>  				  unsigned long crtc_idx_mask,
>  				  struct kmstest_connector_config *config);
> +drmModePropertyBlobPtr kmstest_get_path_blob(int drm_fd, uint32_t connector_id);
>  bool kmstest_probe_connector_config(int drm_fd, uint32_t connector_id,
>  				    unsigned long crtc_idx_mask,
>  				    struct kmstest_connector_config *config);

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat
