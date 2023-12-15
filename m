Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F3A10E320
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Dec 2023 09:28:56 +0000 (UTC)
Message-ID: <27e316db-d543-4c99-a83c-32b2e5d5e34a@amd.com>
Date: Fri, 15 Dec 2023 10:28:48 +0100
Subject: Re: [PATCH i-g-t] tests/amdgpu: fix VM test issue
Content-Language: en-US
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20231214090749.1711421-1-jesse.zhang@amd.com>
 <cadc9180-d2b4-4dee-890b-96c3dc5402d3@amd.com>
 <DM4PR12MB5152AEF19DF4D43F9276809BE393A@DM4PR12MB5152.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <DM4PR12MB5152AEF19DF4D43F9276809BE393A@DM4PR12MB5152.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jesse,

Am 15.12.23 um 02:43 schrieb Zhang, Jesse(Jie):
> [AMD Official Use Only - General]
>
> -----Original Message-----
> From: Koenig, Christian <Christian.Koenig@amd.com>
> Sent: Thursday, December 14, 2023 5:54 PM
> To: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>; igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Luben Tuikov <luben.tuikov@amd.com>; Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Subject: Re: [PATCH i-g-t] tests/amdgpu: fix VM test issue
>
> Am 14.12.23 um 10:07 schrieb Jesse Zhang:
>> In some cases, the size of Vram and GTT is not large, such as mobile devices.
>> It should be skipped.
> Well how much memory is actually needed? The unaligned mmap test should be able to work with something like 2-8MiB.
>
> Maybe we are just using something to big here, that below looks like we are using a 1GiB buffer.
> [Zhang, Jesse(Jie)] Hi Christian,
>    Hi Christian,
> allocate size is 4G(4ULL <<30) in this test. But for some APUs, VRAM size is 512M and GTT size is  3727683584 (=3554M =3G).

Yeah, 4G is way to big. What we need to exercise with this test case is 
that you can allocate a BO with huge pages (> 2M) and map it on an 
unaligned address (e.g. with a 512k offset or something like this).

What was probably tried here as well was to test giant pages (e.g. 1G) 
and align that to something like 512M. That test is nice to have as 
well, but not mandatory.

If you have time to look into it then I suggest to split the test into 
two, one for the 2M (using 8M allocations) case and one for the 1G case 
(using 4G allocation).

The second can then be skipped on APUs when there isn't enough VRAM 
available.

Thanks,
Christian.

> Here is the test code:
>
> static void
> amdgpu_vm_unaligned_map(amdgpu_device_handle device_handle)
> {
>          const uint64_t map_size = (4ULL << 30) - (2 << 12);
>          struct amdgpu_bo_alloc_request request = {};
>          amdgpu_bo_handle buf_handle;
>          amdgpu_va_handle handle;
>          uint64_t vmc_addr;
>          int r;
>
>          request.alloc_size = 4ULL << 30; = 4294967296 = 4G
>          request.phys_alignment = 4096;
>          request.preferred_heap = AMDGPU_GEM_DOMAIN_VRAM;
>          request.flags = AMDGPU_GEM_CREATE_NO_CPU_ACCESS;
>                ...
> Here is the kernel log:
>    200.689133] [drm] initializing kernel modesetting (IP DISCOVERY 0x1002:0x15BF 0x1002:0x0124 0x03).
> [  200.690103] [drm] register mmio base: 0xB0600000
> [  200.690105] [drm] register mmio size: 524288
> [  200.693709] [drm] add ip block number 0 <soc21_common>
> [  200.693711] [drm] add ip block number 1 <gmc_v11_0>
> [  200.693713] [drm] add ip block number 2 <ih_v6_0>
> [  200.693714] [drm] add ip block number 3 <psp>
> [  200.693715] [drm] add ip block number 4 <smu>
> [  200.693716] [drm] add ip block number 5 <dm>
> [  200.693718] [drm] add ip block number 6 <gfx_v11_0>
> [  200.693719] [drm] add ip block number 7 <sdma_v6_0>
> [  200.693720] [drm] add ip block number 8 <vcn_v4_0>
> [  200.693722] [drm] add ip block number 9 <jpeg_v4_0>
> [  200.693723] [drm] add ip block number 10 <mes_v11_0>
> [  200.693736] amdgpu 0000:c2:00.0: amdgpu: Fetched VBIOS from VFCT
> [  200.693738] amdgpu: ATOM BIOS: 113-PHXGENERIC-001
> [  200.710068] [drm] VCN(0) encode/decode are enabled in VM mode
> [  200.711575] amdgpu 0000:c2:00.0: [drm:jpeg_v4_0_early_init [amdgpu]] JPEG decode is enabled in VM mode
> [  200.713991] Console: switching to colour dummy device 80x25
> [  200.714043] amdgpu 0000:c2:00.0: vgaarb: deactivate vga console
> [  200.714046] amdgpu 0000:c2:00.0: amdgpu: Trusted Memory Zone (TMZ) feature enabled
> [  200.714094] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
> [  200.714117] amdgpu 0000:c2:00.0: amdgpu: VRAM: 512M 0x0000008000000000 - 0x000000801FFFFFFF (512M used)
> [  200.714119] amdgpu 0000:c2:00.0: amdgpu: GART: 512M 0x00007FFF00000000 - 0x00007FFF1FFFFFFF
> [  200.714133] [drm] Detected VRAM RAM=512M, BAR=512M
> [  200.714134] [drm] RAM width 128bits LPDDR5
> [  200.714684] [drm] amdgpu: 512M of VRAM memory ready
> [  200.714686] [drm] amdgpu: 3554M of GTT memory ready.
>
> ...
> //dmesg log when run vm test.
> [63261.226958] amdgpu_bo_validate_size[472] domain:4 ####
> [63261.226961] BO size 4294967296 > total memory in domain: 536870912
> [63261.226963] amdgpu_bo_create[573] retunr -ENOMEM ####
> [63261.226967] amdgpu_bo_validate_size[472] domain:6 ####
> [63261.226968] BO size 4294967296 > total memory in domain: 3727683584
> [63261.226970] amdgpu_bo_create[573] retunr -ENOMEM ####
>
> Thanks
> Jesse
>
> Christian.
>
>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>
>> Signed-off-by: Jesse zhang <jesse.zhang@amd.com>
>> ---
>>    tests/amdgpu/amd_vm.c | 4 ++--
>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/amdgpu/amd_vm.c b/tests/amdgpu/amd_vm.c index
>> 11be25ae8..0dde28e2e 100644
>> --- a/tests/amdgpu/amd_vm.c
>> +++ b/tests/amdgpu/amd_vm.c
>> @@ -127,8 +127,8 @@ amdgpu_vm_unaligned_map(amdgpu_device_handle device_handle)
>>        request.preferred_heap = AMDGPU_GEM_DOMAIN_VRAM;
>>        request.flags = AMDGPU_GEM_CREATE_NO_CPU_ACCESS;
>>
>> -     r = amdgpu_bo_alloc(device_handle, &request, &buf_handle);
>> -     igt_assert_eq(r, 0);
>> +     /* Don't let the test fail if the device doesn't have enough VRAM */
>> +     igt_skip_on(amdgpu_bo_alloc(device_handle, &request, &buf_handle));
>>
>>        r = amdgpu_va_range_alloc(device_handle, amdgpu_gpu_va_range_general,
>>                                4ULL << 30, 1ULL << 30, 0, &vmc_addr,
