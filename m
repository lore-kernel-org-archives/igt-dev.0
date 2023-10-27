Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E047510EA0C
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Oct 2023 16:37:28 +0000 (UTC)
Message-ID: <797dd2bf-25a3-4a6a-b2eb-5c5cbdb25b09@collabora.com>
Date: Fri, 27 Oct 2023 17:37:23 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 bhanuprakash.modem@intel.com, igt-dev@lists.freedesktop.org
References: <20231027144022.2016354-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniels@collabora.com>
In-Reply-To: <20231027144022.2016354-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib/igt_kms: Fix memory corruption
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: helen.koike@collabora.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vignesh,

On 27/10/2023 15:40, Vignesh Raman wrote:
> In crosvm, the kernel reports 16 for count_crtcs, which exceeds
> IGT_MAX_PIPES set to 8. The function igt_display_require allocates
> memory for IGT_MAX_PIPES members of igt_pipe_t structures, but then
> writes into it based on the count_crtcs reported by the kernel,
> resulting in memory corruption.

To make this robust against future changes (32 CRTCs seems totally 
fanciful, but so did 16 a while ago), this needs to also be robust 
against count_crtcs exceeding IGT_NUM_PIPES, along the lines of your 
previous change.

Cheers, Daniel
