Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B1AC36010
	for <igt-dev@archiver.kernel.org>; Mon,  7 Apr 2025 23:26:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A0110E3FD;
	Mon,  7 Apr 2025 23:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ciuuoc/I";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C888A10E3FD
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Apr 2025 23:26:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0skE7DE5o9lfU54ph4Qwcax5is4IYCE+0Gax4AIIx4dwRhaEMIpICnMQpQeb02vbyzC1+E8Ezb4jRRNU3AIX8j8VnpcUyOJ3ExWiwzPugIFTnZF++q/EjFh80bBf/87zGaFjfL8/0gM+B4os82gZb2EsO4m6CBj9kCCdPNibZ3Vsy9evqAMloPw8RYenmsPxEgVtueShpwrzFVGpRwzGKEIfK7p3pEtzMZ0pE9AXZoUw8sqfIXkRlMjGUPCpdOA3bt17zZ9aJ2TGUZ+TC5rGI0kqVdJK03T2kbf4XUltdBkYWQtzyHx0cZZ3Zv0kvZDnf4Mu+qEbC6AhXbet3Bfrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iodZ0rSqaWEr5kOzN3F8nxtLYY1bF1kOD0DGJNVURgg=;
 b=dQMyPHqnWqXXMyRG553LYoEs/lZxCCltH2PJAVzmDKfdri/TBpVMGVj3e2vr127IVuGm7gZDaHMJnOb7Y3m+jN7nHDP7ti11/HJmj36Jpz/sWjSPNlGHmPpCD/m8PjSSNboXQusnRVMoFsa2NrD6b/jcFd+CB674NfDkR8jCORkjdXLelsa2eOxoVfkq4YiV6uQIDJBHbgugKbD3jg5oII3bWCHzwpbpWNqIvJpE6VlZdXJRghSEOptwJpsBTSsh396ozOsnBFz5PQ+z0Q4stVeCC14mzo+dxPIqryFbEA+z3yBgGTn+CY7XHnHOIIfoANHjzhgcut9QbefQA4lEKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iodZ0rSqaWEr5kOzN3F8nxtLYY1bF1kOD0DGJNVURgg=;
 b=Ciuuoc/IOqvbWaZMMDxWpiaO63MLvv7W0TCyVbEbwk/qe112XDUIClTyp0OYWKhvN64kwYS3Nrm1Ft4ePAsihy+b6C7t8tYky9Nnacz0h7W66kBhBmPCshs5ZJ0JWZsKG7fFQ4fdr9RskBn3VBZa+GwR05HBIyNUSl6fskneiew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA1PR12MB5658.namprd12.prod.outlook.com (2603:10b6:806:235::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 23:26:44 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 23:26:44 +0000
Message-ID: <4a536b68-ba5f-4484-9581-82555242ac78@amd.com>
Date: Mon, 7 Apr 2025 17:26:42 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 00/37] IGT tests for the KMS Color Pipeline API
To: "Sharma, Swati2" <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com
References: <20250326233609.2980110-1-alex.hung@amd.com>
 <56a5a821-4a97-49ee-bbfe-5578ec878a4f@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <56a5a821-4a97-49ee-bbfe-5578ec878a4f@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0176.namprd04.prod.outlook.com
 (2603:10b6:303:85::31) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA1PR12MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: 390c5fed-3105-4a7a-1cb9-08dd762ba881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SW5UK0hjdkN2UWxOTzgzRTN1OTlGMklhVTI5RVdUU1cyRk5YWDMyZTFGZjE2?=
 =?utf-8?B?SHRNNnNWeUlVUnR2YWhjNS96MUwwT25LMlpoWFIrN0kxT0FuNTFtQUhnbnNh?=
 =?utf-8?B?VU9GUWZEZ1dEMGN2Q0hsbU8yZFNlQWpzZUhSSUs1Z0NJYVJPVGhsRjJHZFNF?=
 =?utf-8?B?bzZXWlRHVEg3bDRGalRhTTNMN1dzUkdKTmhXMUdRM0dEZVN0RGhRY2RNV1Vk?=
 =?utf-8?B?aVhick9YV3k1cVZaSUtJZlNDVXRoVnRjeWg2UkZFUTIyNFB4dklucTF5T2tE?=
 =?utf-8?B?STNZZHdUazM4cHR0MDUyZWpoUnlIUEFUN2xzcGFEZjJ5RkZjTllleHdUeWZK?=
 =?utf-8?B?Y0dwNENDR1VtT3k5ZURVbkZPbE8rRGtMUVlTN2NzSDhFRGZRdi9CRDBoKzd0?=
 =?utf-8?B?VXVuQ2U5V2dLZ0RaRUZaR0s3QlZhVTJENDdFZVlsNzJMSmlRYnhYRmNJTllh?=
 =?utf-8?B?SEhCd1FpalU2cE1Nc3d2OTZZUWZmTlpIR1dhdzRGN1UyR0pSUWVzZ2Flb2dS?=
 =?utf-8?B?SklSTm1SUk43R1o4VHFKUkJzTXpCL0IxTGVobFNFVTBtbTh1Njduckg5N2xy?=
 =?utf-8?B?MGtPTkphZGlYL0wrUlppdkNzMVBEYlJzMnhuQVJZMHVLbW1XR2NsWjVsOWFX?=
 =?utf-8?B?dVRCc3dWeTdJWU9pSmU4WnpKMldJRE1FVkwyRmtldjlPdUo5VkYxL1JLeEU1?=
 =?utf-8?B?a3g3VmV6STVWK3N2RjNKU2k3UHlJNGhYWFExR3FaOGtTNFVkTnA1cHVXZ0Q1?=
 =?utf-8?B?T2JxQ3VPMW1keU9qN2MrVUlCWHZXWVVZQzlSYkxOOTJIek1TbE1TMHRXTVlX?=
 =?utf-8?B?ZWF6OGtnQU9ReW9YRDNIREVCRk1IU2hha2xZUkRCWWZsUjQ2OWpKemNhcEdJ?=
 =?utf-8?B?VG5DcDE5Z3lRc0VtZnRuTFMyMyt2cWFoT3JQNFp2K0lRdWZZK1BDNTIwMHFu?=
 =?utf-8?B?dnVNMGx6bnBqZ2dLKzMvazl5L0p6aGtzckZnQzYxY0dnM2RPdTczSzdMWjVT?=
 =?utf-8?B?dG43KzB1SUxsK0F2MXQwc2dvWEUzNkZYYzRmaFZQNTAwRFRLbEU5MmNVSExV?=
 =?utf-8?B?TEZRaHdkNDkvTk56OXFjQ2JOdTA4T203ZXlxaUpaUkYwS2dSWHVabGRHZnJK?=
 =?utf-8?B?d1NrZ1k1eXdnZTJPWDdrWkx5OGxmVnVRN1VhVzJXNHpwVDNwOHVmOTFNVkMw?=
 =?utf-8?B?dmdyYkUvYUNIOU5scVlYdlYzOUtuejdmM1BVVEFId3JvMDRuZTZhdzlYdys0?=
 =?utf-8?B?WGoxRzlRc3ZuZ3d5YzlsSUVMTVM0NG9CbGJ2Zk5kZjVtQVdkMkJoR21sRlo3?=
 =?utf-8?B?ZExoMG5vSkIyTElRQUtHOVY2eldRWllVbnM1Z1VVR0xSQVRhM1Z1OTgzeTcy?=
 =?utf-8?B?K1FLekY1amFmdUJtMThxL2VzUDZ2OElGeGNOUWIvZEFmVlVweWpaNTFQUmE4?=
 =?utf-8?B?NFQ1WkY2djB1RlYyUXpzUmJ3Tjc2R3cwYWNhWXR3My9mTGRqbFdudWZGOWg4?=
 =?utf-8?B?OG1Qd28waXZpUlViUGZvcEtDNWE1ZkdhTHBQcDlPVlVnc1VzY2V6blJPNjd3?=
 =?utf-8?B?d1AzR0VYYWUwU0I0L0N5c0ZCRENyem1ReHorS213Rm1Rc1lJRnVKU0ZwSDZ2?=
 =?utf-8?B?RXRlbitySGdaVFRJRWsrdVIwMlpsR1IwTUloZmdIOGJMWW5QOUxUL21UTHZm?=
 =?utf-8?B?OVV5NkFIbVdwcS9ONGNyOVF3Z2ZwL1Z3Ni9oVG96SVZra1NiWDg2eTJid3FD?=
 =?utf-8?B?VXFGenBUSkN6dmFNNFA2N2FJNlduTytBSTdEQUpBT2Vqb0piTDNJdFgwbzBo?=
 =?utf-8?B?VjNLYzlGUWdVdU5FZnY5dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXBGeFl1VWI5NGY2Y1k0Z3pFUnVVZmhqRlBEZkJIUm5zRnB4RUlUM0srSVFa?=
 =?utf-8?B?bkxJbzJ6TWFGVFVuY3pheFBsanBJTTNldTEzY1lPeWF6VFRwM05yMURESFBn?=
 =?utf-8?B?dU5EVERSMTh6a0Y5ajNsdUo2dkdUWGxEUnByOW5INHJxMTV5U1dWNUNId0F0?=
 =?utf-8?B?OFhDQUdxMGVWMFNsNkZFNS85R0EraHUxb2NvTU1PdU9EaktNT1dVM3Zyc1M0?=
 =?utf-8?B?dEhzVzBWTmgvd3FKWi9oYzl4VHV6T0ZReUkxY0pCRmM5dnlYenVzVnJCaGFm?=
 =?utf-8?B?U3gwRVVoemd4MHBJV2xjVWRKMGhwOTgxajB4ZExtRU1xZStPbWkrbW1uZEhy?=
 =?utf-8?B?QUUza2NUc2d6cVFoWW5jcGtZWUVkaU0wMnVTYkpzM0JjUFQxdkMvRGU2cGh4?=
 =?utf-8?B?Q08ydzJ2Q1hOMnNkWTRKbTFaQktHMlBoanhNL2hrbERtR1RxOURvOG11ajNB?=
 =?utf-8?B?NGNQdWNkWVR5NE05RThaam5qb1l6d2lxazhEYnhsbEVXOS94STVSZ0hMd2RK?=
 =?utf-8?B?dGJTeUZkYU5mbkVKQmwxUUIxOGh1a2RlTVJJQjUycWVScWcyT3VhRkp4R3o4?=
 =?utf-8?B?UE41ZUVnU1NyUVI4NnlSWkk3c1J3cGMxenJMS2k5TWZjQzRqbkZSSk55NHcx?=
 =?utf-8?B?UEN0SlRBN0pLeS9oOGtyOFJyeHFzczdOa3RKNnovTnFJd1lQZktySWpVRU9m?=
 =?utf-8?B?bnlnaTh2QWNVOUhLWVB6bTlmWFBveWZqV2EyZ2d5cmttd2dXTEVFYW56Vys4?=
 =?utf-8?B?THJvaXBVNTdyVDNDWGwyM1VoK3JwcmNpTGlwaER0SnlZUWhLUGxqVmgrTjB4?=
 =?utf-8?B?VWtBRVVLbUFEcmhPczRVRDhvV280YU01MTQ0M1RnWWM2OUN5ZmxISzkrL2Q5?=
 =?utf-8?B?R2lSelZJSGFWWmpKWXVweThqWWJMdVlCa21JU2RCR1ZtODUrMWlkRFZESXF6?=
 =?utf-8?B?QVE0NUVYYlBmQzZXK1pzaVlHd2RXNFNKRDdpSkdORFJxNXB1MVJCdDkyR0c1?=
 =?utf-8?B?bkJsYlJ6QkJKRmpNcVZ4cGRsT1FXa0ZDTUNyT3RESlVmT1FNakNqanFOTndK?=
 =?utf-8?B?L0lpaE5vcG0rNmtFakFKQTVxcGdqYkdreC9lTG54REFJb3BDZnNTUk90aXBF?=
 =?utf-8?B?Z09vTkU4UWdrZzBHNzZqUG91SmxvUXp6bFNwWUtDRE5yZ0RsNStCQnN0SmtE?=
 =?utf-8?B?LzJhZXJwK1pDTzl2bUk2TkZXZ0NRL0lvQ1pGT2tYQm10NENEanZVakpzb3g2?=
 =?utf-8?B?MUtUZ3RhKytjNWJRYzlKK2NjV0FsbFJlMWdNZEZOVVN1ZitzbzRNZkxJK04y?=
 =?utf-8?B?QjY0TGdLMTROc2ZSYkhnejgwNW0reW5rMDFNZ08vTlpLTCtiRXMzRElSNEdN?=
 =?utf-8?B?R1ZEZVIybml3MU9pNXRyRGdpYXljTVdZYWwvaFlsNllsSG5UZ2RSSUFnc2RD?=
 =?utf-8?B?L1V2bTBpTmUxVG1MRFJhbWFJZ1Q0Q3gwUmNPSlhQU0FXb0ZQaG9LUEtHSldi?=
 =?utf-8?B?aXZIUFJxbm8wNHF3NE9mQ0RVVUZrOVNQL0Z0RFNFS0dKeTgxQ2IxZnROZjhx?=
 =?utf-8?B?TmQ4cGd2K1JETFFNZU0veUVxcTZYUXlxQ21GMlpnWXpvZmNPM1hTRHd2blo1?=
 =?utf-8?B?QnZuWU1icEltd29tMnlxZmswVG5vYjBYUzdUcXZHck1KNnFxV0tuUzBrUmpy?=
 =?utf-8?B?clVyU0tDZzN0cDlZN293NVhMZk9DZHViQnNvZkx5d0g4ZzU4c0NSZGU3MHk0?=
 =?utf-8?B?dkxMeUlNbTdxRDZvYVdwN3hrd0JDY1I0TGVydGdoYzY5bFhweUM1NVVmNnU3?=
 =?utf-8?B?NTBDeXNPZkJDak1wcStBRVFvMUNMMytZN1NsMU9mVit0aVF1dWZuVGFwaU5M?=
 =?utf-8?B?SUVlbFM1cEt5YnFTUjlyOU9LK21wRnU0V0kzR0o2TmxMbXp0OUYrMDBNb21U?=
 =?utf-8?B?ZStRL3FHUEd6d2JCK2lXRGNSZDVYNkNLdFB2c21Ma2dqaFQxVjJsNE1mSFNB?=
 =?utf-8?B?Wis1ZHJoZXBTNWJ6TDJVVjFhV2tnYklCS1BDTjlSVUpFOENaVXc1eWFnMWhE?=
 =?utf-8?B?RVFVRTA5UGRqTzBFRnRMdXFXNEQzMmtHMElncXpTdUNEMC9ST0RhTUlRSWk4?=
 =?utf-8?Q?VZFC72Nqz9RCoBslsur4p9VWv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 390c5fed-3105-4a7a-1cb9-08dd762ba881
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 23:26:44.0637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYQ0vIBJQP4RK7ubgpTQR24osv5cnpEEDx7RHpiV4+aYM9Np+Nd5AQvAjUHs03TmQjjZMz+sWzJQThJ+oTOBxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5658
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

On 4/3/25 04:12, Sharma, Swati2 wrote:
> Hi Alex,
> 
> I could see there were few patches from Bhanu in rev4
> required to enable plane color pipeline on intel h/w.
> https://patchwork.freedesktop.org/series/123448/#rev4
> 
> However, those seems missing on latest rev7.

Hi Swati,

Thanks for reviews.

Regarding to Intel's IGT series:

Both kernel (V8) and IGT (V7) series for color pipeline have changed 
significantly. Not only I am not able to apply all patches cleanly but 
also applying them breaks the color pipeline APIs.

For example, DRM_COLOROP_CTM_3X3 and DRM_COLOROP_1D_LUT_MULTSEG were 
inserted existing enum drm_colorop_type. IGT kms_colorop tests fails 
without inserting them in kernel patchset.

We do not have Intel hardware and knowledge of Intel hardware to rebase 
Intel's kernel and IGT patchsets to the latest changes.

A summary of Bhanu's patchset as below:

- No longer needed:
   tests/kms_properties: Fix compilation errors

- Still applicable (I will include it in V8)
   lib/igt_kms: Destroy colorops on exit

- Need to be rebased by Intel
   lib/colorops: Move few helpers to common place to reuse
   drm-uapi: Add 3x3 CTM
   drm-uapi: Add multi segmented 1D LUT
   lib/igt_color: Add support for 3x3 matrices
   lib/colorops: Add support for Custom 1D LUT
   tests/kms_color_helper: Add helpers to clear colorops data
   tests/kms_color: Add plane color pipeline tests for Intel hardware


> 
> On 27-03-2025 05:05 am, Alex Hung wrote:
>> This series introduces support for
>> * drm_colorop DRM objects
>> * COLOR_PIPELINE plane property
>>
>> Kernel changes can be found at [1] and on dri-devel.
>>
>> It also adds a new kms_colorop test case that tests the color pipeline
>> API. The tests are designed to be easily extensible with a "transform"
>> and "compare" function pointer for each test. The "transform" function
>> performs the transformations under test via SW routines. The "compare"
>> function compares the DRM/KMS result (via a writeback connector) with
>> the result derived via the SW "transform".
>>
>> This series introduces a number of tests for pre-defined transfer
>> functions, custom LUTs, 3x4 CTMs, a multiplier, 3D LUT, and a bypass
>> test.
>>
>> It tests 8-bit and 10-bit RGB surface formats, depending on driver 
>> support
>> on the drm_plane as well as the writeback drm_connector end.
>>
>> [1] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color- 
>> pipeline-v8
>>
>> v7:
>>   - Add more documents and sync up with kernel implementation
>>   - Update 3DLUT tests according to kernel changes
>>
>> v5:
>>   - Bypass test
>>   - 10 bpc support
>>   - Proper setup and cleanup
>>   - PQ/BT2020 TFs
>>   - 1D LUT tests
>>   - Multiplier tests
>>   - 3D LUT test
>>
>> v4:
>>   - Intel color pipeline work, to possibly be combined with v5 in a 
>> future iteration.
>>
>> v3:
>>   - Remove need for IOCTLs and libdrm changes
>>   - Test colorop properties with both atomic and legacy code paths
>>   - move enum drm_colorop_type to drm_mode.h
>>   - Add descriptions for public functions in lib (Kamil)
>>   - Use SPDX style license identifier (Kamil)
>>   - Replace Skia license comment with copyright note in file header
>>   - Fix kms_colorop subtests if applicable color pipeline not found
>>
>> Alex Hung (9):
>>    lib/igt_kms: increase MAX_NUM_COLOROPS to 128
>>    tests/kms_colorop: Add a sRGB test for EOTF -> Inverse EOTF -> EOTF
>>    lib/igt_color: Add 1D LUT color transformation support
>>    test/kms_colorop: Add tests that exercise the 1D LUT colorops
>>    tests/kms_colorop: Add multiplier tests
>>    scripts/convert_3dlut.py Convert a 3D LUT to igt_3dlut_t array for 3D
>>      LUT API
>>    tests/kms_colorop: Add a 3D LUT subtest
>>    drm-uapi: Update kernel doc for drm_colorop_type
>>    drm-uapi: Sync up definition with kernel colorop implementation
>>
>> Harry Wentland (28):
>>    lib/drmtest: Add is_vkms_device()
>>    tests/kms_writeback: Fix kms_writeback for VKMS
>>    lib/igt_kms: Move get_writeback_formats_blob to lib
>>    lib/igt_kms: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>>    include/drm-uapi: Add COLOROP object
>>    drm-uapi: Add 3x4 CTM
>>    drm-uapi: Add 1D LUT drm_colorop_type
>>    lib/igt_kms: Introduce drm_colorop and COLOR_PIPELINE
>>    tests/kms_properties: Add colorop properties test
>>    igt/color: Add SW color transform functionality
>>    lib/igt_fb: Add copy_fb function
>>    tests/kms_colorop: Add kms_colorop tests
>>    lib/igt_kms: Add support for DATA colorop property
>>    lib/igt_color: Add support for 3x4 matrices
>>    tests/kms_colorop: Add 3x4 CTM tests
>>    tests/kms_colorop: Add bypass test
>>    tests/kms_colorop: Parametrize the buffer format
>>    tests/kms_colorop: Add 10bpc test and skip if format not supported
>>    tests/kms_colorop: Skip if writeback does not support fourcc
>>    lib/igt_fb: Allow any non-planar format for igt_copy_fb
>>    kms/colorop: Do proper setup and cleanup
>>    lib/igt_color: Support color transform for XRGB2101010
>>    tests/kms_colorop: Set wide [13, 13] bracket for comparison on amdgpu
>>    lib/igt_color: Add PQ variants for 0-1 and 0-125 range
>>    tests/kms_colorop: Add tests for PQ variants
>>    lib/igt_color: add BT2020/BT709 transfer functions
>>    tests/kms_colorop: Add tests for BT2020/BT709 TFs
>>    lib/igt_color: Point license header at skia license
>>
>>   include/drm-uapi/amdgpu_drm.h |    9 -
>>   include/drm-uapi/drm.h        |   15 +
>>   include/drm-uapi/drm_mode.h   |   99 +
>>   lib/drmtest.c                 |    5 +
>>   lib/drmtest.h                 |    1 +
>>   lib/igt_color.c               |  648 +++++
>>   lib/igt_color.h               |  162 ++
>>   lib/igt_color_lut.h           | 4946 +++++++++++++++++++++++++++++++++
>>   lib/igt_fb.c                  |   34 +-
>>   lib/igt_fb.h                  |    3 +
>>   lib/igt_kms.c                 |  359 ++-
>>   lib/igt_kms.h                 |  100 +
>>   lib/meson.build               |    1 +
>>   scripts/convert_3dlut.py      |   94 +
>>   tests/kms_colorop.c           |  702 +++++
>>   tests/kms_colorop.h           |  261 ++
>>   tests/kms_properties.c        |   94 +-
>>   tests/kms_writeback.c         |   38 +-
>>   tests/meson.build             |    1 +
>>   19 files changed, 7523 insertions(+), 49 deletions(-)
>>   create mode 100644 lib/igt_color.c
>>   create mode 100644 lib/igt_color.h
>>   create mode 100644 lib/igt_color_lut.h
>>   create mode 100755 scripts/convert_3dlut.py
>>   create mode 100644 tests/kms_colorop.c
>>   create mode 100644 tests/kms_colorop.h
>>
> 

