Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D47710E24D
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Sep 2023 13:34:28 +0000 (UTC)
Message-ID: <40ce77bb-03c6-4f10-bbc9-f7e58fba8bb8@amd.com>
Date: Mon, 25 Sep 2023 09:34:19 -0400
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
References: <20230915225237.116176-1-alex.hung@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230915225237.116176-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 0/3][i-g-t][V3] kms_writeback: support
 DRM_FORMAT_XRGB2101010 in kms_writeback
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: brian.starkey@arm.com, maxime@cerno.tech
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Series is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

On 2023-09-15 18:52, Alex Hung wrote:
> kms_writeback only checked and supported DRM_FORMAT_XRGB8888. This
> patchset enables 10 bit supports in lib and add new subtests for
> DRM_FORMAT_XRGB2101010 in kms_writeback.
> 
> V2 - allow kms_writeback to run subtests for multiple DRM_FORMAT_XRGB*
> V3 - 1. move uint32_t fourcc[] to check_writeback_config() and
>         use DRM_FORMAT_XRGB* directly in igt_main_args()
>      2. remove incorrect comments
> 
> Alex Hung (3):
>   lib/igt_fb: use the entire 32 bit for fnv1a_crc
>   lib/igt_fb: add 10 bits (XRGB2101010) supports in fnv1a_crc
>   tests/kms_writeback: support DRM_FORMAT_XRGB2101010 for writeback
> 
>  lib/igt_fb.c          |  15 +++--
>  tests/kms_writeback.c | 136 +++++++++++++++++++++++++++++++++---------
>  2 files changed, 116 insertions(+), 35 deletions(-)
> 
