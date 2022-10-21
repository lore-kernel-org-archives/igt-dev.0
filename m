Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D10B10E25D
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Oct 2022 21:07:51 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id
 cc18-20020a05622a411200b0039cdeb3a699so3325118qtb.23
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Oct 2022 14:07:50 -0700 (PDT)
Message-ID: <dbadbf293272cd8ddf6001739193acadd42e13fe.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Mark Yacoub <markyacoub@chromium.org>, igt-dev@lists.freedesktop.org
Date: Fri, 21 Oct 2022 17:07:47 -0400
In-Reply-To: <20221019174217.201103-1-markyacoub@chromium.org>
References: <20221019174217.201103-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] chamelium: Get connector After plug to get
 EDID
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

On Wed, 2022-10-19 at 13:42 -0400, Mark Yacoub wrote:
> [Why]
> MST connectors can change connector IDs between plugs. Getting the EDID
> prop requires a valid connector ID.
> 
> [How]
> Get Connector AFTER a plug, just before it's being used.
> 
> Fixes: kms_chamelium@dp-edid-read
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/chamelium/kms_chamelium.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/chamelium/kms_chamelium.c b/tests/chamelium/kms_chamelium.c
> index 870edb91..99cc23a1 100644
> --- a/tests/chamelium/kms_chamelium.c
> +++ b/tests/chamelium/kms_chamelium.c
> @@ -447,8 +447,7 @@ static void
>  igt_custom_edid_type_read(data_t *data, struct chamelium_port *port, enum igt_custom_edid_type edid)
>  {
>  	drmModePropertyBlobPtr edid_blob = NULL;
> -	drmModeConnector *connector = chamelium_port_get_connector(
> -	    data->chamelium, port, false);
> +	drmModeConnector *connector;
>  	size_t raw_edid_size;
>  	const struct edid *raw_edid;
>  	uint64_t edid_blob_id;
> @@ -464,6 +463,7 @@ igt_custom_edid_type_read(data_t *data, struct chamelium_port *port, enum igt_cu
>  
>  	igt_skip_on(check_analog_bridge(data, port));
>  
> +	connector = chamelium_port_get_connector(data->chamelium, port, true);
>  	igt_assert(kmstest_get_property(data->drm_fd, connector->connector_id,
>  					DRM_MODE_OBJECT_CONNECTOR, "EDID", NULL,
>  					&edid_blob_id, NULL));

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat
