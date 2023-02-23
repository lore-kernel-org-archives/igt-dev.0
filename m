Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3B710E054
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 10:27:19 +0000 (UTC)
Message-ID: <d42c6f8a-e0b3-5992-baed-a635ac6baed5@intel.com>
Date: Thu, 23 Feb 2023 15:56:30 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>, <juhapekka.heikkila@gmail.com>
References: <20230212062758.1956925-1-bhanuprakash.modem@intel.com>
 <20230212062758.1956925-2-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230212062758.1956925-2-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 2/2] Revert "tests/intel-ci: Rename
 kms_cursor_legacy subtests in BAT"
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


On 2/12/2023 11:57 AM, Bhanuprakash Modem wrote:
> This reverts commit e6bb684a6e21efa9c880d888dd4c5a498aed3389.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/fast-feedback.testlist | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 4188e9737..d9fcb62d6 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -101,9 +101,14 @@ igt@kms_chamelium_frames@hdmi-crc-fast
>   igt@kms_chamelium_hpd@vga-hpd-fast
>   igt@kms_chamelium_edid@vga-edid-read
>   igt@kms_prop_blob@basic
> -igt@kms_cursor_legacy@basic-busy-flip-before-cursor
> -igt@kms_cursor_legacy@basic-flip-after-cursor
> -igt@kms_cursor_legacy@basic-flip-before-cursor
> +igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
> +igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
> +igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
> +igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
> +igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
> +igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
> +igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
> +igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
>   igt@kms_flip@basic-flip-vs-dpms
>   igt@kms_flip@basic-flip-vs-modeset
>   igt@kms_flip@basic-flip-vs-wf_vblank
