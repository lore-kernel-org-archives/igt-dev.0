Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F24B10E4A4
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Oct 2022 09:10:01 +0000 (UTC)
Date: Thu, 20 Oct 2022 12:09:46 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>
Message-ID: <Y1EQWpv++0pANV5j@platvala-desk.ger.corp.intel.com>
References: <20221019174217.201103-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019174217.201103-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH] chamelium: Get connector After plug to get
 EDID
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, amstan@chromium.org, ihf@google.com,
 igt-dev@lists.freedesktop.org, seanpaul@chromium.org, matthewtlam@google.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 01:42:17PM -0400, Mark Yacoub wrote:
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

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

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
> -- 
> 2.38.0.413.g74048e4d9e-goog
> 
