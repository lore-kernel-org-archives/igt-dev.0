Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFD16E218
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Feb 2021 09:23:04 +0000 (UTC)
Date: Thu, 25 Feb 2021 11:23:21 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YDdsiQXH1k9Xx9qK@platvala-desk.ger.corp.intel.com>
References: <20210225090954.31197-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210225090954.31197-1-ankit.k.nautiyal@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_invalid_dotclock: Skip the
 test if big joiner is supported
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
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 25, 2021 at 02:39:54PM +0530, Ankit Nautiyal wrote:
> Currently the test assumes that the modes with clock more than the
> maximum dot clock will be rejected. This fails in case of
> platforms that combine multiple pipes and modes higher than the
> maximum dotclock can still be supported.
> 
> This patch adds a check to skip the test if big joiner can be
> supported for a given platform and connector.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  tests/kms_invalid_dotclock.c | 51 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_invalid_dotclock.c b/tests/kms_invalid_dotclock.c
> index 402629ab..5692736b 100644
> --- a/tests/kms_invalid_dotclock.c
> +++ b/tests/kms_invalid_dotclock.c
> @@ -44,6 +44,44 @@ static bool has_scaling_mode_prop(data_t *data)
>  				    NULL, NULL, NULL);
>  }
>  
> +static bool
> +is_dsc_capable(int drm_fd, drmModeConnector *connector)
> +{
> +	int debugfs_fd = igt_debugfs_dir(drm_fd);
> +	char filename[128];
> +	char buf[512];
> +	bool dsc = false;
> +
> +	sprintf(filename, "%s-%d",
> +		kmstest_connector_type_str(connector->connector_type),
> +		connector->connector_type_id);
> +
> +	strcat(filename, "/i915_dsc_fec_support");
> +
> +	if (igt_debugfs_simple_read(debugfs_fd, filename, buf,
> +				    sizeof(buf)) > 0)
> +		dsc = strstr(buf, "DSC_Sink_Support: yes") ? true : false;
> +
> +	close(debugfs_fd);
> +
> +	return dsc;
> +}

Consider moving this to lib/. There's another such function in
kms_dp_dsc.c already.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
