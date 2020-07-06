Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFBC897F3
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2020 17:26:50 +0000 (UTC)
Received: by mail-qv1-f70.google.com with SMTP id s2so9861991qvn.19
 for <igt-dev@lists.freedesktop.org>; Mon, 06 Jul 2020 10:26:43 -0700 (PDT)
Message-ID: <61bcc08133762bf5f6e358873493cd116eb49fdf.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Mon, 06 Jul 2020 13:26:41 -0400
In-Reply-To: <20200703050302.25937-1-kunal1.joshi@intel.com>
References: <20200703050302.25937-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_chamelium: Wait for connectors
 after replugging them at exit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: lyude@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2020-07-03 at 10:33 +0530, Kunal Joshi wrote:
> From: Imre Deak <imre.deak@intel.com>
> 
> Making sure all the plugged chamelium ports are connected at exit
> So the FB console restore modeset doesn't happen on a disconnected output,
> resulting in link training failures.
> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> Tested-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_chamelium.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 58e01ab7..e8ead97a 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -2538,6 +2538,11 @@ void chamelium_deinit(struct chamelium *chamelium)
>  	for (i = 0; i < chamelium->port_count; i++)
>  		chamelium_plug(chamelium, &chamelium->ports[i]);
>  
> +	igt_assert(chamelium->drm_fd != -1);
> +	for (i = 0; i < chamelium->port_count; i++)
> +		wait_for_connected_state(chamelium->drm_fd,
> +					 &chamelium->ports[i].connector_id, 1);
> +
>  	/* Destroy any EDIDs we created to make sure we don't leak them */
>  	igt_list_for_each_entry_safe(pos, tmp, &chamelium->edids, link) {
>  		for (i = 0; i < CHAMELIUM_MAX_PORTS; i++) {

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
