Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAEC6E093
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Mar 2021 06:42:38 +0000 (UTC)
References: <20210317224222.447100-1-lyude@redhat.com>
From: Martin Peres <martin.peres@mupuf.org>
Message-ID: <2bcaa3ba-7bf4-3f39-df09-ea6f8c0e12cd@mupuf.org>
Date: Thu, 18 Mar 2021 08:42:27 +0200
MIME-Version: 1.0
In-Reply-To: <20210317224222.447100-1-lyude@redhat.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 0/3] tests/kms_color: Fixup for nouveau
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
To: Lyude <lyude@redhat.com>, igt-dev@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org, Martin Peres <martin.peres@free.fr>, Ben Skeggs <bskeggs@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 18/03/2021 00:42, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> This patch series just introduces a small drive-by cleanup for
> kms_color, and fixes the kms_color test so that it works correctly on
> nouveau. Note that the invalid LUT/gamma tests will likely currently
> fail, but I'm going to be submitting some kernel patches to fix these in
> nouveau very shortly.

The series is:

Reviewed-by: Martin Peres <martin.peres@mupuf.org>

> 
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Jeremy Cline <jcline@redhat.com>
> 
> Lyude Paul (3):
>    tests/kms_color: Don't opencode igt_check_crc_equal()
>    tests/kms_color: Allow tests to run on any driver
>    tests/kms_color: Stop leaking fbs
> 
>   tests/kms_color.c        | 15 +++++++++++++--
>   tests/kms_color_helper.c |  6 ------
>   2 files changed, 13 insertions(+), 8 deletions(-)
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
