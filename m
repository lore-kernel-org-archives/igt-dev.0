Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F72E6E4DE
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 15:20:35 +0000 (UTC)
Received: by mail-qv1-f72.google.com with SMTP id h12so37363056qvm.9
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 08:20:32 -0700 (PDT)
Date: Mon, 22 Mar 2021 11:20:29 -0400
From: Jeremy Cline <jcline@redhat.com>
Message-ID: <YFi1vSzOYycRRe7b@xps13>
References: <20210317224222.447100-1-lyude@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210317224222.447100-1-lyude@redhat.com>
Content-Disposition: inline
Subject: Re: [igt-dev] [PATCH i-g-t 0/3] tests/kms_color: Fixup for nouveau
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
To: Lyude <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org, Martin Peres <martin.peres@free.fr>, Ben Skeggs <bskeggs@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Mar 17, 2021 at 06:42:19PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> This patch series just introduces a small drive-by cleanup for
> kms_color, and fixes the kms_color test so that it works correctly on
> nouveau. Note that the invalid LUT/gamma tests will likely currently
> fail, but I'm going to be submitting some kernel patches to fix these in
> nouveau very shortly.
> 
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Jeremy Cline <jcline@redhat.com>
> 
> Lyude Paul (3):
>   tests/kms_color: Don't opencode igt_check_crc_equal()
>   tests/kms_color: Allow tests to run on any driver
>   tests/kms_color: Stop leaking fbs
> 
>  tests/kms_color.c        | 15 +++++++++++++--
>  tests/kms_color_helper.c |  6 ------
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 

Reviewed-by: Jeremy Cline <jcline@redhat.com>

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
