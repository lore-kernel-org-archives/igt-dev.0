Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41591CCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 14:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFC910E8ED;
	Thu,  6 Nov 2025 14:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJvdJTyw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4774310E8ED
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 14:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762438602; x=1793974602;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1fIRj6Oxh6wZdZQcwMhdQuTafoRt8fu15Cdq0KZEdEM=;
 b=MJvdJTyw8yritGbPiLXfB7YZAjey4EHcdkgKn52PBeu2OQ+MEZqMmbdL
 zUdNi8W6nLFxDE1S1Bs8Fusangaf3EgzmTNhioa/GetDwTswqvsRUcYPe
 jcRc8vUAAICb9IHj5gbN/O6eh++QQR3DxojxucSbyfO/s4n4r5wYfXTTQ
 GEDN7snRBkMRgMvwxfMSNySSHhhnUI4HBq1hNp052idSA+raxKm1tjneh
 MLLMJ51ih/eLLFALzpAld/zcsr9ro9J6T8PD7OiOnYYfix8JRqBexldOF
 alFGOHdJnZp1ldot9Sxt1fe/UAqz0AnR1hL9ohl+AfEoCEmwUcAhSwTxN w==;
X-CSE-ConnectionGUID: sPXss+O5R3eR4yZn2lgSGQ==
X-CSE-MsgGUID: kJQ4WazLRg2OkQIjZH/jNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68411940"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="68411940"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 06:16:41 -0800
X-CSE-ConnectionGUID: XyJk2VQET+i1dVjI08bcwA==
X-CSE-MsgGUID: 5MB7h0rhRqKVeKmryHDi9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187711361"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.180.65])
 ([172.28.180.65])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 06:16:41 -0800
Message-ID: <44900a04-98aa-4ca5-bddb-2f7893ea4cab@linux.intel.com>
Date: Thu, 6 Nov 2025 15:16:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/6] tests/intel/xe_sriov_flr: Use global MMIO
 context initialized in verify_flr
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, lukasz.laguna@intel.com,
 jakub1.kolakowski@intel.com
References: <20251031125633.1374273-1-marcin.bernatowicz@linux.intel.com>
 <20251031125633.1374273-6-marcin.bernatowicz@linux.intel.com>
 <20251106120359.lsujdlwqgkcmp7cw@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20251106120359.lsujdlwqgkcmp7cw@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>


On 11/6/2025 1:03 PM, Piotr Piórkowski wrote:
> Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com> wrote on pią [2025-paź-31 13:56:32 +0100]:
>> Move MMIO initialization to verify_flr() after VF enable and PCI reinit.
>> Replace per-subcheck MMIO pointers with a global context accessed via
>> xe_mmio_for_vf() to simplify resource management.
>>
>> Suggested-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   tests/intel/xe_sriov_flr.c | 90 ++++++++++++++++++++++++--------------
>>   1 file changed, 57 insertions(+), 33 deletions(-)
>>
>> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
>> index 38b303391..a42090744 100644
>> --- a/tests/intel/xe_sriov_flr.c
>> +++ b/tests/intel/xe_sriov_flr.c
>> @@ -55,6 +55,44 @@ IGT_TEST_DESCRIPTION("Xe tests for SR-IOV VF FLR (Functional Level Reset)");
>>   
>>   const char *SKIP_REASON = "SKIP";
>>   
>> +static struct g_mmio {
>> +	struct xe_mmio *mmio;
>> +	int num_vfs;
> NIT: I don't understand why you insist on using int for num_vfs.
> You don't need negative values, and as far as I know, GGTT limits us to 1023 VFs anyway.
Will update to unsigned int, since that’s what most of our helpers use.
If we ever want to mirror kernel field types more closely, we could 
switch to uint16_t.
>
>> +} g_mmio;
>> +
>> +static inline struct xe_mmio *xe_mmio_for_vf(unsigned int vf)
>> +{
>> +	igt_assert_f(g_mmio.mmio, "MMIO not initialized\n");
>> +	igt_assert_f(vf <= g_mmio.num_vfs, "VF%u out of range (<= %u)\n", vf,
>> +		     g_mmio.num_vfs);
>> +	return &g_mmio.mmio[vf];
>> +}
>> +
>> +static void init_mmio(int pf_fd, unsigned int num_vfs)
>> +{
>> +	igt_assert_f(!g_mmio.mmio, "MMIO already initialized\n");
>> +	g_mmio.mmio = calloc(num_vfs + 1, sizeof(*g_mmio.mmio));
>> +	igt_assert(g_mmio.mmio);
>> +
>> +	for (unsigned int i = 0; i <= num_vfs; ++i)
>> +		xe_mmio_vf_access_init(pf_fd, i, &g_mmio.mmio[i]);
>> +
>> +	g_mmio.num_vfs = num_vfs;
>> +}
>> +
>> +static void cleanup_mmio(void)
>> +{
>> +	if (!g_mmio.mmio)
>> +		return;
>> +
>> +	for (size_t i = 0; i <= g_mmio.num_vfs; ++i)
>> +		if (xe_mmio_is_initialized(&g_mmio.mmio[i]))
>> +			xe_mmio_access_fini(&g_mmio.mmio[i]);
>> +	free(g_mmio.mmio);
>> +	g_mmio.mmio = NULL;
>> +	g_mmio.num_vfs = 0;
>> +}
>> +
>>   /**
>>    * struct subcheck_data - Base structure for subcheck data.
>>    *
>> @@ -285,6 +323,8 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
>>   	if (igt_warn_on(igt_pci_system_reinit()))
>>   		goto disable_vfs;
>>   
>> +	init_mmio(pf_fd, num_vfs);
>> +
>>   	for (i = 0; i < num_checks; ++i)
>>   		checks[i].init(checks[i].data);
>>   
>> @@ -303,6 +343,8 @@ cleanup:
>>   	for (i = 0; i < num_checks; ++i)
>>   		checks[i].cleanup(checks[i].data);
>>   
>> +	cleanup_mmio();
>> +
>>   disable_vfs:
>>   	igt_sriov_disable_vfs(pf_fd);
>>   
>> @@ -489,7 +531,6 @@ struct ggtt_provisioned_offset_range {
>>   struct ggtt_data {
>>   	struct subcheck_data base;
>>   	struct ggtt_provisioned_offset_range *pte_offsets;
>> -	struct xe_mmio *mmio;
>>   	struct ggtt_ops ggtt;
>>   };
>>   
>> @@ -544,11 +585,12 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>>   	struct xe_sriov_provisioned_range *ranges;
>>   	uint8_t tile = gdata->base.tile;
>>   	unsigned int nr_ranges;
>> +	struct xe_mmio *mmio = xe_mmio_for_vf(0);
>>   
>>   	gdata->pte_offsets = calloc(num_vfs + 1, sizeof(*gdata->pte_offsets));
>>   	igt_assert(gdata->pte_offsets);
>>   
>> -	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, tile, gdata->mmio,
>> +	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, tile, mmio,
>>   							 &ranges, &nr_ranges);
>>   	if (ret) {
>>   		set_skip_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges (%d)\n",
>> @@ -603,19 +645,15 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
>>   	else
>>   		gdata->ggtt.set_pte = intel_set_pte;
>>   
>> -	if (gdata->mmio) {
>> -		if (!xe_mmio_is_initialized(&gdata->mmio[0]))
>> -			xe_mmio_vf_access_init(data->pf_fd, 0 /*PF*/, gdata->mmio);
>> -
>> -		populate_ggtt_pte_offsets(gdata);
>> -	} else {
>> -		set_skip_reason(data, "xe_mmio is NULL\n");
>> -	}
>> +	if (populate_ggtt_pte_offsets(gdata))
>> +		/* skip reason set in populate_ggtt_pte_offsets */
>> +		return;
>>   }
>>   
>>   static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>>   {
>>   	struct ggtt_data *gdata = (struct ggtt_data *)data;
>> +	struct xe_mmio *mmio = xe_mmio_for_vf(0);
>>   	xe_ggtt_pte_t pte;
>>   	uint32_t pte_offset;
>>   
>> @@ -628,7 +666,7 @@ static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>>   		  gdata->pte_offsets[vf_id].end);
>>   
>>   	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
>> -		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, data->tile, pte_offset,
>> +		if (!set_pte_gpa(&gdata->ggtt, mmio, data->tile, pte_offset,
>>   				 (uint8_t)vf_id, &pte)) {
>>   			set_skip_reason(data,
>>   					"Prepare VF%u failed, unexpected gpa: Read PTE: %#" PRIx64 " at offset: %#x\n",
>> @@ -642,6 +680,7 @@ static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>>   {
>>   	struct ggtt_data *gdata = (struct ggtt_data *)data;
>>   	uint8_t expected = (vf_id == flr_vf_id) ? 0 : vf_id;
>> +	struct xe_mmio *mmio = xe_mmio_for_vf(0);
>>   	xe_ggtt_pte_t pte;
>>   	uint32_t pte_offset;
>>   
>> @@ -649,7 +688,7 @@ static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>>   		return;
>>   
>>   	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
>> -		if (!check_pte_gpa(&gdata->ggtt, gdata->mmio, data->tile, pte_offset,
>> +		if (!check_pte_gpa(&gdata->ggtt, mmio, data->tile, pte_offset,
>>   				   expected, &pte)) {
>>   			set_fail_reason(data,
>>   					"GGTT check after VF%u FLR failed on VF%u: Read PTE: %#" PRIx64 " at offset: %#x\n",
>> @@ -828,7 +867,6 @@ static void lmem_subcheck_cleanup(struct subcheck_data *data)
>>   
>>   struct regs_data {
>>   	struct subcheck_data base;
>> -	struct xe_mmio *mmio;
>>   	uint32_t reg_addr;
>>   	int reg_count;
>>   };
>> @@ -846,6 +884,7 @@ static void regs_subcheck_init(struct subcheck_data *data)
>>   static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>>   {
>>   	struct regs_data *rdata = (struct regs_data *)data;
>> +	struct xe_mmio *mmio = xe_mmio_for_vf(vf_id);
>>   	uint8_t tile = data->tile;
>>   	uint32_t reg;
>>   	int i;
>> @@ -853,14 +892,11 @@ static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>>   	if (data->stop_reason)
>>   		return;
>>   
>> -	if (!xe_mmio_is_initialized(&rdata->mmio[vf_id]))
>> -		xe_mmio_vf_access_init(data->pf_fd, vf_id, &rdata->mmio[vf_id]);
>> -
>>   	for (i = 0; i < rdata->reg_count; i++) {
>>   		reg = rdata->reg_addr + i * 4;
>>   
>> -		xe_mmio_tile_write32(&rdata->mmio[vf_id], tile, reg, vf_id);
>> -		if (xe_mmio_tile_read32(&rdata->mmio[vf_id], tile, reg) != vf_id) {
>> +		xe_mmio_tile_write32(mmio, tile, reg, vf_id);
>> +		if (xe_mmio_tile_read32(mmio, tile, reg) != vf_id) {
>>   			set_skip_reason(data, "Registers write/read check failed on VF%u\n", vf_id);
>>   			return;
>>   		}
>> @@ -871,6 +907,7 @@ static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>>   {
>>   	struct regs_data *rdata = (struct regs_data *)data;
>>   	uint32_t expected = (vf_id == flr_vf_id) ? 0 : vf_id;
>> +	struct xe_mmio *mmio = xe_mmio_for_vf(vf_id);
>>   	uint32_t reg;
>>   	int i;
>>   
>> @@ -880,7 +917,7 @@ static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>>   	for (i = 0; i < rdata->reg_count; i++) {
>>   		reg = rdata->reg_addr + i * 4;
>>   
>> -		if (xe_mmio_tile_read32(&rdata->mmio[vf_id], data->tile, reg) != expected) {
>> +		if (xe_mmio_tile_read32(mmio, data->tile, reg) != expected) {
>>   			set_fail_reason(data,
>>   					"Registers check after VF%u FLR failed on VF%u\n",
>>   					flr_vf_id, vf_id);
>> @@ -889,18 +926,12 @@ static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>>   	}
>>   }
>>   
>> -static void regs_subcheck_cleanup(struct subcheck_data *data) { }
>> -
>> -static void cleanup_mmio(struct xe_mmio *mmio, int num_vfs)
>> +static void regs_subcheck_cleanup(struct subcheck_data *data)
>>   {
>> -	for (int i = 0; i <= num_vfs; ++i)
>> -		if (xe_mmio_is_initialized(&mmio[i]))
>> -			xe_mmio_access_fini(&mmio[i]);
>>   }
>>   
>>   static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>>   {
>> -	struct xe_mmio mmio[num_vfs + 1];
>>   	const uint8_t num_tiles = xe_tiles_count(pf_fd);
>>   	struct subcheck_data base;
>>   	struct ggtt_data gdata[num_tiles];
>> @@ -912,8 +943,6 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>>   	struct subcheck checks[num_checks];
>>   	unsigned int i = 0, t;
>>   
>> -	memset(mmio, 0, sizeof(mmio));
>> -
>>   	xe_for_each_tile(pf_fd, t) {
>>   		igt_assert_lt(i, num_tiles);
>>   		base = (struct subcheck_data){ .pf_fd = pf_fd,
>> @@ -922,7 +951,6 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>>   
>>   		gdata[i] = (struct ggtt_data){
>>   			.base = base,
>> -			.mmio = mmio,
>>   		};
>>   		checks[i * subcheck_count + 0] = (struct subcheck){
>>   			.data = (struct subcheck_data *)&gdata[i],
>> @@ -947,7 +975,6 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>>   
>>   		scratch_data[i] = (struct regs_data){
>>   			.base = base,
>> -			.mmio = mmio,
>>   			.reg_addr = SCRATCH_REG,
>>   			.reg_count = SCRATCH_REG_COUNT,
>>   		};
>> @@ -962,7 +989,6 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>>   
>>   		media_scratch_data[i] = (struct regs_data){
>>   			.base = base,
>> -			.mmio = mmio,
>>   			.reg_addr = MED_SCRATCH_REG,
>>   			.reg_count = MED_SCRATCH_REG_COUNT,
>>   		};
>> @@ -980,8 +1006,6 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>>   	igt_assert_eq(i * subcheck_count, num_checks);
>>   
>>   	verify_flr(pf_fd, num_vfs, checks, num_checks, exec_strategy);
>> -
>> -	cleanup_mmio(mmio, num_vfs);
>>   }
> LGTM:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

Thanks for review,

marcin

>>   
>>   igt_main
>> -- 
>> 2.43.0
>>
