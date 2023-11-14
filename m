Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3047810E1F8
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 09:40:08 +0000 (UTC)
Message-ID: <ebccf257-6d08-4e67-94b7-e1bdd6989606@intel.com>
Date: Tue, 14 Nov 2023 15:10:04 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
References: <20231114090926.1618995-1-kunal1.joshi@intel.com>
 <20231114090926.1618995-9-kunal1.joshi@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20231114090926.1618995-9-kunal1.joshi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH 8/8] tests/intel-ci/xe-fast-feedback: update
 renamed tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 14-Nov-23 2:39 PM, Kunal Joshi wrote:
> Previously since there were only two categories
> psr and psr2, there was no psr_ prefix, updated
> testlist with prefix
> 
> Cc: Jouni Högander <jouni.hogander@intel.com>
> Cc: Animesh Manna <animesh.manna@intel.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel-ci/xe-fast-feedback.testlist | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index f11761ac8..a3e61bb4c 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -207,9 +207,9 @@ igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
>   igt@kms_pipe_crc_basic@read-crc
>   igt@kms_pipe_crc_basic@read-crc-frame-sequence
>   igt@kms_prop_blob@basic
> -igt@kms_psr@primary_page_flip
> -igt@kms_psr@cursor_plane_move
> -igt@kms_psr@sprite_plane_onoff
> +igt@kms_psr@psr_primary_page_flip
> +igt@kms_psr@psr_cursor_plane_move
> +igt@kms_psr@psr_sprite_plane_onoff
>   
>   # All tests that do module unloading and reloading are executed last.
>   # They will sometimes reveal issues of earlier tests leaving the
