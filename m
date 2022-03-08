Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CFE10E360
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Mar 2022 20:34:04 +0000 (UTC)
Message-ID: <593db758-3e67-44c1-d0b9-e19eaf795eeb@amd.com>
Date: Tue, 8 Mar 2022 15:33:59 -0500
Content-Language: en-US
To: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
References: <20220302084631.10605-1-Wayne.Lin@amd.com>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
In-Reply-To: <20220302084631.10605-1-Wayne.Lin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Modify amd_link_settings test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2022-03-02 03:46, Wayne Lin wrote:
> "7f484824 lib/igt_amd: correct the link_settings bug"
> After applying above patch to fix a bug within igt_amd.c, it starts to
> fail the test amd_link_settings@link-training-configs. The main readson
> for the failure is due to inappropriate implementation of this test.
> 
> This patch series is trying to adjust some steps in the test.
> 
> Wayne Lin (2):
>    tests/amdgpu/amd_link_settings: Ignore CRC checking
>    tests/amdgpu/amd_link_settings: Change the flow when exit test
> 
>   tests/amdgpu/amd_link_settings.c | 67 ++++++--------------------------
>   1 file changed, 11 insertions(+), 56 deletions(-)
> 

Hi Lakshmi,

I think this is a false-positive since it failed in a test that does not 
associate with this series. Follows the link to this patch:

  https://patchwork.freedesktop.org/series/100936/

What do you think?

Thanks
