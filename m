Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD64B10E07E
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 13:53:00 +0000 (UTC)
Message-ID: <ce2dfbb2-291e-81b3-f4c3-3dbcf4cce4bf@collabora.com>
Date: Thu, 9 Nov 2023 19:22:54 +0530
MIME-Version: 1.0
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 daniels@collabora.com, igt-dev@lists.freedesktop.org
References: <20231108062902.390248-1-vignesh.raman@collabora.com>
 <d55de7e5-a23e-5a5d-794f-cc38e159e440@intel.com>
 <5214fd60-8fde-13c8-f3ec-02391d846ae6@collabora.com>
In-Reply-To: <5214fd60-8fde-13c8-f3ec-02391d846ae6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3] lib/igt_kms: Fix memory corruption
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

Hi Bhanu,

On 09/11/23 19:11, Vignesh Raman wrote:
> Hi Bhanu,
> 
> On 09/11/23 17:19, Modem, Bhanuprakash wrote:
>> Hi Vignesh,
>>
>> As we introduced the IGT documentation[1] to generate the testlist, we 
>> need a fix in few kms tests to compile the IGT.
>>
>> Also, needs few changes in intel-ci/ to avoid noise in the CI.
>>
>> [1]: 
>> https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/docs/test_documentation.md
> 
> Are you referring to the pipeline failures in 
> https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1029126
> 
> In my forked branch the pipeline fails in containers stage,
> https://gitlab.freedesktop.org/vigneshraman/igt-gpu-tools/-/pipelines/1030263
> 
> Is there a way to run the pipeline in my fork or should I
> locally build docs (build igt-gpu-tools-doc) with the patch
> and check the issue?

I can reproduce the error with,
scripts/igt_doc.py --config tests/intel/kms_test_config.json --rest 
docs/testplan/kms_tests.rst --check-testlist --igt-build-path build/

I will check these warnings.

Regards,
Vignesh
