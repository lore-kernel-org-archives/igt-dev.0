Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B99D6AAF0
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 16:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE5010EF67;
	Thu,  2 Apr 2026 16:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CY87MbwN";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012026.outbound.protection.outlook.com
 [40.107.200.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224A210EF67
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 16:33:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UygaNpt1OKMxCYJFUhUmzSHGOhk0NsYQQOvsENaIF+Vwx6uBIwqHHPni9KPY6WBvSX5JA7zYP49F6mPXJRYfleT12Cwo6GGtl7I1HpL9G+LBNvffHgeLUBoo7ywnBa8Ejla+qWyEeyN2/3qeHI5lUeMKWdNU6m8+Qjb6wUJx7gOK87Dzu9poo3ENxdze0tFREoyFWJq/aTipq1fCciXhtKLSwvE/ZU/fxVA31UYKupwZQ710Brs1CVCQb89tcpeGfFc9R4M7v/0Wi4RoF5DIOUqRIdh04iSu+nhWsVo/FjaL8nvhEN7rgSk6h4ePsTH2R5CXQZJz03ImgToTwVIciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xy6d2PODd/4FOP5XRzMo2vOB86MkQRu7wdWjHm0a3jw=;
 b=xnpUwepUwhiPORU7yEJFC5pbme/iUuQ8qEuU5Hm5k8j29zr8B0x3c1muS3OQTVjG13TpD34kFgZffMJ+bUpqTZKuNCn+tcQq613rSMBliFFsRgTFhcVLLPvmmDt7w00OoE40x7N+FGRK2GN6WRLk50I6RWSRRqleBFpjpSH+/I84LxvKiUNN2nHDOTuREeB0k4K7Qyb2XbGtfW9XqcNSnEkUEonqRV/75m6NpRS4J8YOfj3vpvnr8VkjCd+ReGYou3TvCIYWEEX4sHo3Lqn4yrH++Lm/gvB30W3l4/QISZuy1UWKWqu71TNQNC7MznhXX7uGdL6LhlSCmtWwH9ymnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xy6d2PODd/4FOP5XRzMo2vOB86MkQRu7wdWjHm0a3jw=;
 b=CY87MbwN5xzMw2G3HWktzaGiL2dXdfA7oe1u4gTSRphho+eY8hSTKGzUvyfB54Puz0AdH7xxIpj31XIvq5JRs8rY5DxRu/Wkk5QvNCI78abP2UQZcZfZd5Cway+whaNPihV16T0NpwhYQR9pfr3TrK2lJccB05Jy7V1cuB/goNM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by PH8PR12MB8605.namprd12.prod.outlook.com (2603:10b6:510:1cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 16:33:55 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::715:65fb:c3fa:9c26]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::715:65fb:c3fa:9c26%5]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 16:33:55 +0000
Content-Type: multipart/alternative;
 boundary="------------jS7ac3pepYlGB5e0UG3uwbuK"
Message-ID: <f0ea4825-af35-47fc-9578-d521988bc0f3@amd.com>
Date: Thu, 2 Apr 2026 12:33:52 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amd/amd_fuzzing: Fix compilation error on
 fedora
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260402152439.1691178-1-karthik.b.s@intel.com>
 <20260402153634.2wzz6pdw4fmr66yk@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260402153634.2wzz6pdw4fmr66yk@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: YT3PR01CA0148.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::9) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|PH8PR12MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 36af8d84-9ed3-4a95-ffc9-08de90d5a213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: FXu6aI6+WfsAeryO6MTCkRmPR102MLFIPv8bUu5Pomt7nrJR18D0WJLIwkicsf7uFL8PNlje7w0FG2wikagxrzzr1VNTrXKPLPuOD1muwdIzDlJ+cQv8h/DqmVjFmZEyyLPjayZDOnKOWdDhrQ0tm1Q/eEkx4Rsv6HcrGtxYp7ZpklFC8zlGbRiYYgsn21ONa3la9VyOHa4h867lvUez7KdS+f0ZiTqY5XAQBMExgYNdfFOZnStMPn4t/WUXvloEizPQc6S3he+6rvuMdspoRRtvvMfdN8a6p0sXZtDJwfymluNH5Cjx2JJtd79XLwyiA59pmKM8WYFwBmBH+jcx3eBYz8azIE+Zddoy01ZiQ/4CiO0EfQ3fgo7HwCwvtpyE98Lx0uJJqeE2H2B5GCXMWauzShkt6DsBnca1VSO8Ua83GUXxoi62GvOL2p1Ig4VewTneAlCmnmN1cZj+jU3imqrAUq85p85UP+Q52TsBVdOXDu2oC8R8dnLXUoGd4cbaA/KqPcgKvIz3+KSJsRq4F+t1Azddu3kNudXW6iDKlAYUOo03hUJAsaV8I3NIK07Rwo5wqYost2unyh0rGX9PttAPrazWvm16FNME9MyyWR2QrFIB69HAiQLAZZHWx9kxvMZ/idJVYxbjgoZ5DoiQlqvHLok5W28ksisJEoLeE8tDBsvwl45DUKNE7ghdW7EZNHcIx6tRHCEg3Nc4GJbaipi3VBXDZVAn1KPJpGrAW5g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEhFMCsxejNCMHgvYXdieU0xeGM2Z21HekJKckdjVGJoQ2V4OC94MXVzeTVU?=
 =?utf-8?B?a05zVDhuRzZyYnh4RmNQbHVsWHQ2aEdYMndyRzdhMzlZRXJoY1puMVN2SFJO?=
 =?utf-8?B?SEtqTy9YRTZkZTc3aEEwdTU0RDduMkFlSXBEbk5zS1BCcDYrNjRSVnFBd0Zk?=
 =?utf-8?B?UEZlTkhudEJLakZLaGovbjl0b09RS01ncmVheXZZdWlWemUvS3AvaG8wVVp2?=
 =?utf-8?B?WGk2eTFqTTRjUEdYSTh0NlpJRERRTFVHK2UxOHV6MzVrbFRCcmhic3VCckRl?=
 =?utf-8?B?eGczN2ZOVS9CMmNoNGp5c29KVzhZMXBQM1g4Z1pBOE1UT2ovWUdGUmpWQURh?=
 =?utf-8?B?VUhYRWIvQ09NT1dtQ3YvOGZXdTcxMnFQYmgxaVh3TXhjRDdNTk1zZ1ROd0F2?=
 =?utf-8?B?TVpKRDR2eVQ5aG9PbWFHMEp2VEMvNThuenJvRHlhYnc4UXdFdFFJVmpJUkVm?=
 =?utf-8?B?Y3JDWU1pNXdsSm1qbmxicEVKZ3hHZkRRVTVBSllUdXdUQ1RoOTBTeGZhMk0v?=
 =?utf-8?B?SjJBUGdTazVQWHJreFU2WUNoWVFlMGRkR3FsTUJqZktiaXdkTk5TLzlxd3FX?=
 =?utf-8?B?cGs2eWNkRVBUb1Y1NzZYMjJsVm90Y2JUZVFpaEJCa051eFhhV3FNRzJtbEor?=
 =?utf-8?B?K3VpeHFEN1VxUjkwTlRkU2dGK2ZqbWR6N3g3RmR5a3RHZ0k4eDJTVE1SL0x6?=
 =?utf-8?B?UUtKdGdISk5HKzdBSjNmQUticURwSENHRCt1QlpRYlJYeWpQRjRJTGNDZG9U?=
 =?utf-8?B?LzZFaWpCZ1Z1VjhLUnlzUkxNK2xCMU5UVWdRMzQ3clpSRzQzVUQ0eXhoWElN?=
 =?utf-8?B?ZjNMaHYvTDg5aVRPbW9lR2daUkF4K3d4eERxWTZOd1MwcVBCeUpJb2F5MlRw?=
 =?utf-8?B?Vmx3c2ZzVXpTRWtaMVRnYy8yemh1aDZ4SjFtL0thRVhXNndtN2lCUUVuakdE?=
 =?utf-8?B?SWlJRTVCaitTaVdEZlBCNWZPTExrRDdsMnhjZnhtdTBacnluTUZwcHZ4aDdy?=
 =?utf-8?B?Z0xEcXRESGhjQk9UNTJEZDNWTXBCM3htVUVPSytyTm94QzFWdUY5eEJnc0Nq?=
 =?utf-8?B?aXg4M1ZTcHRkejBqSUFWSUNhakNFbUJZUktMbjlacVZ5ZFJtMUMrQXB1VUxm?=
 =?utf-8?B?MHMreDBOaEE4dmVpUE9HM3ZMZC9QT1RSbVpFRGc3djEzSEtPMGNrSGhSd2N3?=
 =?utf-8?B?ZkdyMDB1RlFHbWhtRG1CMUFoS3RRQlNzQkMzbTBLTUx3TFFsOFBBTjgrNzZQ?=
 =?utf-8?B?Rnd6SVlnN1ZET0FKK0pWcHNXQklOYlZIQTlQZE1xVkd2dlU3KzNNc2NLcEtH?=
 =?utf-8?B?aXVJK0dTUmpwbFNEakxiT3UxSERQOEtUbVRvNC83NUNMMmdHbCtZUkhPekcz?=
 =?utf-8?B?cWlWMGdrWEM4OTZuTUNSSit1d0Q1bFZCWUMwSFhwNXBmSHBwSlpnNGxpRlIx?=
 =?utf-8?B?c3E1NHNuazE4N25IeCtRRGZvMnY5VFNYNlF6OXlOUFFJNi8yM1c0MGVIb2hW?=
 =?utf-8?B?ZEtqQjVzQVBhOFZicG9rN3pqKzRrODNkeUErc1FwdjFnaVo1TE1YeEs2OENv?=
 =?utf-8?B?d3M3RExvZE0vOUJZY1lZZEFWNkZ0d2tPRFBSQnNUb2pVeDJCYjdmUUxkckNj?=
 =?utf-8?B?dVNHakNBRmZ0b2JZZDVCSnZwb3lpNGJFc3ErNjB4SGsvRW1ENFhZVVVEVnRL?=
 =?utf-8?B?dC8xajBwWEZzbS9RUDBROVRKdUpkd2xmVUQwL1J4NE1SNnd5dHorZGE3VEtp?=
 =?utf-8?B?K1FIZ1JRdGFpT2tZQmJ5NFZuUzA1V3lxdTZuRE1GTWY1TklwYStGcHdGNzMw?=
 =?utf-8?B?MEIwb2s1THpoc0tQUmJCemc1VTgzWnBGVFBYNElXQ01USWZ3YzQrQVJST0p5?=
 =?utf-8?B?UkxhRTlxNmtBL0IyZHpPcVkvWTRtQTNNVnJpN3RGSk13Sk1iRlhLb1l6Z1d1?=
 =?utf-8?B?bkkwa2tsYXQwTmhla0I3RlM4SWVKUkFSenY1ZmxDRDVISHR3RGhZYW5nRHR0?=
 =?utf-8?B?andSTjJtYWxJelNZK0ZHSE5WYkNtM0JFZm9hT0U5ZmduT3VSQ0FqSlVMZEYx?=
 =?utf-8?B?dVBDNlovYmdocW5ha282bTFVNEZWZkp5a1lxMGw0Z0hDbUNCcFRQRUJQWDcy?=
 =?utf-8?B?N2RpUGRVMFh5MjBiNkErbmhGNHlja2k1azMwN1BQenZtS3BoNGM0ejNSZzhX?=
 =?utf-8?B?bG1yNWVrRSsxMnUwVHBhNldMbGw3Y05zai8wb2tEb25FQjE2SG1UMHpXZUd6?=
 =?utf-8?B?MGNuMVRzazhOc29pdUJ0UUNkRm81UWRneVd6TDlDYWpMem9HM2NxWFhocWYw?=
 =?utf-8?B?TEw1Y1FkN1pCdkh4TlhnQlN3dThqVjJ6UGp5amxNSlAvOWdMcFhUZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36af8d84-9ed3-4a95-ffc9-08de90d5a213
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 16:33:55.5821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRWJyE/9xrOxgAvH06Rn0j9Ok+WRruDW/RhN0QGeLdsW4ZcmK4osHRoA0Fl09SC34Y8W5S8k28yvxZwz0RopDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8605
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

--------------jS7ac3pepYlGB5e0UG3uwbuK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kamil,

Thanks for pointing this out, including the checkpatch.pl angle.

I also found quite a few checkpatch/style warnings in this area, and I will send a cleanup patch for those formatting/style issues soon.

Thanks, Vitaly

On 2026-04-02 11:36, Kamil Konieczny wrote:
> Hi Karthik,
> On 2026-04-02 at 20:54:39 +0530, Karthik B S wrote:
>> Fix compilation error:
>>
>> ../tests/amdgpu/amd_fuzzing.c: In function ‘amd_kgd_multi_ioctl_field_fuzzing’:
>> ../tests/amdgpu/amd_fuzzing.c:1103:13: error: ‘have_amdgpu_dev’ undeclared (first use in this function); did you mean ‘amdgpu_dev’?
>>  1103 |         if (have_amdgpu_dev) {
>>       |             ^~~~~~~~~~~~~~~
>>       |             amdgpu_dev
>>
>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Fixes: d512e54bbace ("tests/amdgpu/amd_fuzzing: Remove unused variable")
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> btw using
> 	bool b = (ptr != NULL);
> is strange and should be catched by checkpatch.pl. In this case just
> use 'ptr', no point in using helper var.'
You are right about |bool b = (ptr != NULL)| here — in this case the helper variable is unnecessary.
>
> This also shows that code inside ifdef/endif should be very minimal
> and all code should compile.
>
> Vitalyi, what about only placing one var per one ifdef? For example:
>
> #ifdef AMDGPU_USERQ_ENABLED
> 	bool amdgpu_userq_enabled = true;
> #else
> 	bool amdgpu_userq_enabled = false;
> #endif
>
> and have you code always compile?

For the broader #ifdef point, I agree in principle and will try to keep those blocks minimal, but in amd_fuzzing.c some USERQ paths still need to stay under #ifdef AMDGPU_USERQ_ENABLED because they use USERQ-specific types/ioctls.

>
> Regards,
> Kamil 
>
>> ---
>>  tests/amdgpu/amd_fuzzing.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
>> index 00717e593..9d7468ea4 100644
>> --- a/tests/amdgpu/amd_fuzzing.c
>> +++ b/tests/amdgpu/amd_fuzzing.c
>> @@ -1100,7 +1100,7 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>>  	 * Note: USERQ_WAIT has no timeout field; it is not a blocking wait.
>>  	 * It only registers the dependency.  We therefore only test ret==0.
>>  	 */
>> -	if (have_amdgpu_dev) {
>> +	if (amdgpu_dev) {
>>  		uint32_t timeline_handle = 0;
>>  		uint32_t timeline_handles[1];
>>  		uint64_t timeline_points[1];
>> @@ -1142,7 +1142,7 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>>  	 * Note: USERQ_WAIT has no timeout field and is not a blocking call; it
>>  	 * only registers a dependency.  We therefore only verify ret==0 here.
>>  	 */
>> -	if (have_amdgpu_dev) {
>> +	if (amdgpu_dev) {
>>  		uint32_t timeline_handles[2] = { 0, 0 };
>>  		uint64_t signal_points[2] = { 8, 8 };
>>  		uint64_t wait_points[2]   = { 8, 8 }; /* both already signaled */
>> -- 
>> 2.43.0
>>
--------------jS7ac3pepYlGB5e0UG3uwbuK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Kamil,<br>
    <br>
    Thanks for pointing this out, including the checkpatch.pl angle.<br>
    <br>
    I also found quite a few checkpatch/style warnings in this area, and
    I will send a cleanup patch for those formatting/style issues soon.
    <p>Thanks, Vitaly</p>
    <div class="moz-cite-prefix">On 2026-04-02 11:36, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260402153634.2wzz6pdw4fmr66yk@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi Karthik,
On 2026-04-02 at 20:54:39 +0530, Karthik B S wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Fix compilation error:

../tests/amdgpu/amd_fuzzing.c: In function ‘amd_kgd_multi_ioctl_field_fuzzing’:
../tests/amdgpu/amd_fuzzing.c:1103:13: error: ‘have_amdgpu_dev’ undeclared (first use in this function); did you mean ‘amdgpu_dev’?
 1103 |         if (have_amdgpu_dev) {
      |             ^~~~~~~~~~~~~~~
      |             amdgpu_dev

Cc: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>
Cc: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>
Fixes: d512e54bbace (&quot;tests/amdgpu/amd_fuzzing: Remove unused variable&quot;)
Signed-off-by: Karthik B S <a class="moz-txt-link-rfc2396E" href="mailto:karthik.b.s@intel.com">&lt;karthik.b.s@intel.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
LGTM
Reviewed-by: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>

btw using
	bool b = (ptr != NULL);
is strange and should be catched by checkpatch.pl. In this case just
use 'ptr', no point in using helper var.'</pre>
    </blockquote>
    You are right about <code data-start="97" data-end="121">bool b =
      (ptr != NULL)</code> here — in this case the helper variable is
    unnecessary.
    <blockquote type="cite" cite="mid:20260402153634.2wzz6pdw4fmr66yk@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

This also shows that code inside ifdef/endif should be very minimal
and all code should compile.

Vitalyi, what about only placing one var per one ifdef? For example:

#ifdef AMDGPU_USERQ_ENABLED
	bool amdgpu_userq_enabled = true;
#else
	bool amdgpu_userq_enabled = false;
#endif

and have you code always compile?</pre>
    </blockquote>
    <br>
    For the broader #ifdef point, I agree in principle and will try to
    keep those blocks minimal, but in amd_fuzzing.c some USERQ paths
    still need to stay under #ifdef AMDGPU_USERQ_ENABLED because they
    use USERQ-specific types/ioctls.<br>
    <br>
    <blockquote type="cite" cite="mid:20260402153634.2wzz6pdw4fmr66yk@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

Regards,
Kamil 

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">---
 tests/amdgpu/amd_fuzzing.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
index 00717e593..9d7468ea4 100644
--- a/tests/amdgpu/amd_fuzzing.c
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -1100,7 +1100,7 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 	 * Note: USERQ_WAIT has no timeout field; it is not a blocking wait.
 	 * It only registers the dependency.  We therefore only test ret==0.
 	 */
-	if (have_amdgpu_dev) {
+	if (amdgpu_dev) {
 		uint32_t timeline_handle = 0;
 		uint32_t timeline_handles[1];
 		uint64_t timeline_points[1];
@@ -1142,7 +1142,7 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 	 * Note: USERQ_WAIT has no timeout field and is not a blocking call; it
 	 * only registers a dependency.  We therefore only verify ret==0 here.
 	 */
-	if (have_amdgpu_dev) {
+	if (amdgpu_dev) {
 		uint32_t timeline_handles[2] = { 0, 0 };
 		uint64_t signal_points[2] = { 8, 8 };
 		uint64_t wait_points[2]   = { 8, 8 }; /* both already signaled */
-- 
2.43.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------jS7ac3pepYlGB5e0UG3uwbuK--
