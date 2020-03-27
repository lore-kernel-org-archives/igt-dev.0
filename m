Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7086EA0D
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2020 12:09:33 +0000 (UTC)
References: <1580401532-24828-1-git-send-email-nidhi1.gupta@intel.com>
From: "Manna, Animesh" <animesh.manna@intel.com>
Message-ID: <2b9f6d6f-fdd5-cac8-1675-8aa1c8fbd441@intel.com>
Date: Fri, 27 Mar 2020 17:39:28 +0530
MIME-Version: 1.0
In-Reply-To: <1580401532-24828-1-git-send-email-nidhi1.gupta@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] Add eDP support in Link Layer
 Compliance Tool
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Nidhi Gupta <nidhi1.gupta@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 30-01-2020 21:55, Nidhi Gupta wrote:
> As Link Layer Compliance Tool for DP-PHY test
> automation only supports DP, so now added support
> for eDP as well.
>
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>

LGTM,
Reviewed-by: Animesh Manna <animesh.manna@intel.com>

> ---
>   tools/intel_dp_compliance.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
> index 5cc3d37..8a771bb 100644
> --- a/tools/intel_dp_compliance.c
> +++ b/tools/intel_dp_compliance.c
> @@ -849,7 +849,8 @@ int update_display(int mode, bool is_compliance_test)
>   		conn = &connectors[cnt];
>   		conn->id = resources->connectors[cnt];
>   		c = drmModeGetConnector(drm_fd, conn->id);
> -		if (c->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
> +		if ((c->connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
> +		    c->connector_type == DRM_MODE_CONNECTOR_eDP) &&
>   		    c->connection == DRM_MODE_CONNECTED) {
>   			test_connector_id = c->connector_id;
>   			conn->connector = c;
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
