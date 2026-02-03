Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24ED3D172A0
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 01:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2BC10E2F7;
	Tue,  3 Feb 2026 01:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JVcD8auB";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010023.outbound.protection.outlook.com
 [52.101.193.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C07A10E2F7
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 01:25:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E52e8vrhfN98Od3kyjKBqEv++pF6WCP6ZdmH1gURRz12HhcAbQVw+ijjSh6HDJ44z3idF01HwcNfPjpQIqkFFaODTHeXZOygbl+baGCD+f6exJ5C1hUxQ3N7jIer/EHmB4EMnmorX3+U7ZqrAbwrpsC9arWDHP4kyphsWOAYl58L/SJqscOTGy7wjjfUmrZRNT5VnrHifH+6wNUKiqdIxVoFYCQDtXfxTgydDdKbiT9BnZYG/YsEZFldL/bFebiw3DKtw+m6/RSQO1rlFxHwuKsfMMzGofKparhx1yCUFcPN/pPEPf/QvBLygy4LxbN6TAd0AaMRyH1R9yxayjo0kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAAi3+eZcBXSiyoIl2mu7rd2yX+XT+XegcduJVvwqso=;
 b=cjSpLlEJUR3uCKN28G/dbGq32iwUrACAbFK/XUb61FGN24NXxOFfyyC0ots6a17sel8KQkdLU80mJbMCAGgFSbpazia5SRtpzfIrYOU4KW99UZ/FYq1Q5sXaOjnAAOWnmeLzOorOIBiyihke+swLZ3WLsKuzO/FvlMaD0m5RxU5/akPlFRYpuUxmLAOWlODbMesBUAuBgNXJOcQ3qt5514Ah4tXMNYnuvltlbgoRFwn+ZO3OFhptElMC+HysckRipK5OlDFvKxWVh/DRzXXluyVFMMLpd1MOrdKjVazgN20mLZIeHdvxYYtd64zwQVsnmkNcNzYpBuxR4mS/2SCf3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAAi3+eZcBXSiyoIl2mu7rd2yX+XT+XegcduJVvwqso=;
 b=JVcD8auBMb+JHhD21oXAYNOfSFHQgkE7+NZxeDf8m2ZaTKxnF38L17sYYOPUDKrJaWyWAdlIr5FgwPwBPQygP2u1qTTtfhFJPoIaEleDstJb4CCP3st9Q/ml8w9i7h87XR6JIoVa2bmsevdRUBOQ8uSLIkzJbZI/EdLdhM4YhLI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DS0PR12MB7511.namprd12.prod.outlook.com (2603:10b6:8:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 01:24:57 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 01:24:57 +0000
Message-ID: <7636e3a3-bb59-4fe4-927d-0919c599aab7@amd.com>
Date: Mon, 2 Feb 2026 20:24:53 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/amdgpu/amd_jpeg_dec: Add VCN JPEG IB alignment
To: Tessita Thomas <Tessita.Thomas@amd.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260202050738.518285-1-Tessita.Thomas@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260202050738.518285-1-Tessita.Thomas@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::37) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DS0PR12MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: ed8bb990-087c-443a-366a-08de62c30a85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nkw5ZWY5ekU3TjFIM3pwUWZWUTJHbHFtZ0JubWs0TUF5TWl6QlBoRjFmaVli?=
 =?utf-8?B?OHJaWVVuRCtEVnFpdDFSWjhvczVZTFVnai9kdkR0UWkyM0ROVWQvbDIyWFE5?=
 =?utf-8?B?eENrVUI3ZnV4NDVSZzRLZzBOb3hydzFlTThSQVdIbnQycjlwRllGajZmaXJB?=
 =?utf-8?B?MVB2N01pWnFCQ2V3Q0lFeno3VGs4T0FlWmFuY05uUEZJd01jWnJzK0RNUk52?=
 =?utf-8?B?T2lVTCt5RThveWNOU0traXEvckxiMmhTWEhRK1JqYmo3a1MvelNTd2hzc0xK?=
 =?utf-8?B?Y1cycHZXNXdzYXhhNGZKYVRqQXBVL2c5aTRwLzdUbzR6QTNIcHdOVEVYWEdS?=
 =?utf-8?B?YkYxdzFiR1dPTEVXMHQxMmxWemNwampUQzFyZ2x1bHJoMzFLMFE0VG1iV0l4?=
 =?utf-8?B?dmFHR21FS3hYbEpTaWp6aGRmdTJMVWdDN25reDE4cVR1OWtqZGVQMGd2cGJw?=
 =?utf-8?B?ZDVoOS9veU1qK2gxOENtOFRQaWdyVm9nSGo0VUFKaS9wbFJncHZhUnJ1c25Y?=
 =?utf-8?B?THpyRmRxR0RLSXBnNHIyTno2dEFyaWFTdERUS3FoS1NKSEU2alRNdjd5ZkI0?=
 =?utf-8?B?RWx4RWhWcnRTZDdxUWZ6UGVZV21FcEdVOEJFZ0Uwd1phMis3endnNlFVT1pL?=
 =?utf-8?B?QXNvenp1NHdmcFJEMnpuV0RaM2R4cVJGYVY5eFVIMnRCckxXMG5vcVFPUXhX?=
 =?utf-8?B?dytrYmx5S0ZwZVRTdlZtREZZd1BMYStkMEVGdGN5L2UxVklPdUV3ZFV6Smwv?=
 =?utf-8?B?eDVYTmJlUXU5dUFxcnN6dG13eEtja0IxYmpVTWRteFdiVVdzZ3hsVG5kcDd5?=
 =?utf-8?B?Y0tCWmFicWFCSjNIa0l5UGV3eHU2MmNldnZXSWgxZXZXQ1JBN3FGd2l4U3Zi?=
 =?utf-8?B?ZEcwMndZOVVXY3JHcitNOFY4R3NxZWM4YzhBSi9mai9nTmgxRXJiUWdwYTMz?=
 =?utf-8?B?YTVCOXhnV1dQWklGVThPNjh1YUcvWnNTdlF3MzZCRmVlOWNuSjNxMlhraTgr?=
 =?utf-8?B?dzdrcjFpZXlGQUZXTCtQVHpoUk5sRWdCN2VEWllITmZOU0orUnB3ZnJSVm5v?=
 =?utf-8?B?eWNRQm8rckxoVEhySXZJODZtUHB4VzdDcWk3ZWhxKzNNS1I0WFZndkhnWk1G?=
 =?utf-8?B?Tm4yVEVlaEFhRk03UlFSNGI5NUlTTWlDYTZjZGZWTXJoTHlDNnhEcG8zN2Ry?=
 =?utf-8?B?YjltRUR5QWM4RGRhMmdRcnIxa0pCMStIWGRHRXpwei9MRjVFVzNIclZucGYv?=
 =?utf-8?B?SkFBdU9YcU9tMkI0bWt3UytZbjZub1RMNm9wRklwKzV2ZTlEMkhSWDk3Q2RL?=
 =?utf-8?B?Z2lmYUJTR2VteDFIUG5mZ05ubkhTbS9XQjdkaGh5VkZ0WkpjWi9STHc2OTF6?=
 =?utf-8?B?ZFNOOVdIS2ZQa1pEc2k0L0FoMDBIMFNvWmFPY2cvcitDdzl5MVNEWlExVzFk?=
 =?utf-8?B?K3pKaXBkUTdQelhSSlE5OXFMdkhjRlgxUTZENUJPQjdGdnhjWGQ4U3AzSjk5?=
 =?utf-8?B?Z1Zod0JFS1djUTBnYTFrUXA2cStpdGRjMVB0akp0UGVQV2t6NktkT2hUTVJI?=
 =?utf-8?B?OTRHVzdNaGNpOXNWeURJL2ZHNk5kYWdpNnovbGdqcHY1YzZ3aHVWQXl0V05t?=
 =?utf-8?B?Z2k4ZFZscDFwMjEwOFRra0xQUVdNWkVnYWlwaVhmaHNEMkpwZmVQS2hLaGYz?=
 =?utf-8?B?bWxmamVQeFZRZllmQkhqVzFTRExRb2xFRmlLVHhHU3hZWjY5VERpMDUyTjEw?=
 =?utf-8?B?VHlXc3NjZ2VDNkZBbEtmb0FsVGZ0V0IxSExwd1VVR2h3Y1paekVTMzFKNENo?=
 =?utf-8?B?WlI3bmhick40Q0ozbForbWpNOEtVVklObEIxdWVZWEtHVkRuejlrSG9ZbHZx?=
 =?utf-8?B?MXZGVVVseThhQlBNWUNYNmpCSVJUS2hVcVJjc1dNLzZ2VVF4RDQyOWdWSmVK?=
 =?utf-8?B?S2Q1ODBJdk01a1Z0ekIxcnZocFhlNm9yTzB4U3BJTEE0NzZ2VTNHa25xTGRH?=
 =?utf-8?B?WFArQ3dHd3NScVcybTZzbHhMQXBwT3NNZnJySVVxbHFmZGJpMHc0WTVxekZB?=
 =?utf-8?B?ejNVNzlQbnBLeUc1WmJ6MDUrMkZqN0hWVXVhWktFUXlxOWpqWGhadVR2SUJR?=
 =?utf-8?Q?kum4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1haajlFZmtzTEUrWEQrazFZdzJlL3BYcUllaU9NMjk1U2o5NjNURFpEOE9C?=
 =?utf-8?B?U3l5bm9vaXZLSDJZZmNjNWo3TzFnYlJSbm1BSjYrWGhyWTFDN3FRblp0N0U5?=
 =?utf-8?B?dFQyOEl4bkdGQlArUUZvNHh6SmRmbkE5djc5Q0xzMHVLcDBGVUowRyt4TS9P?=
 =?utf-8?B?dTI4SEdoWldUQVluK3BJNWI0bGpNVnVTSHUvakFKdi9OR2UyKzEwdzl6ajha?=
 =?utf-8?B?L2dMRDE2N1Z6L2FGVmcrUndYV3l3SkcyU1ZkS0hQQ2xadC9MZEtjTEVlUWNx?=
 =?utf-8?B?dnh5czJNSnNucHNmV21YRWZxZGJXOWd2TzB5K0hKVEQ0SnAwR3JKclhkSDNT?=
 =?utf-8?B?ZzBVbmxxTk1TM0IvUEplN0ExS2FvdDB6eUhmcXRnZHZvZ1phaVlIb08xZ0Rw?=
 =?utf-8?B?VE1zOUxoeGRTY3VscHpmNzFDK29WaFdIbWkydTNMNmw4Nks4VnlqVlJDT3JK?=
 =?utf-8?B?d1lrNXE4am4xaGJGcFRveVlvdm9yU0dZeG84L2xZZHg3TnBhb1QvR2VkUGV2?=
 =?utf-8?B?N2txUnBOVFBSVGRaRktHZ2h0SjdVUEd0ODZCOVV5QVEwYkVTd1ZpVjRQRkNE?=
 =?utf-8?B?a0laRnVNTHNFalNLck9HWVBkUFJBSkNESm52T2VzZGhENzcrTlVONlJkT0tG?=
 =?utf-8?B?Zzd5TUNLeHBqQTJLSExHb2dzSm5vTUp6aVFhZVo5amhRMEw2cjRhZzlibndW?=
 =?utf-8?B?QlVvUVZmaElVUnpJaktSL0NCUTU5R01PTjJiOWtydEFCZVBhNGt0MTBjWDBI?=
 =?utf-8?B?cmF2KzdnTHl0WGFzVzFmMlgwQk4xMEZIWlllNzllRWthRlpJWTRVaGlNblgy?=
 =?utf-8?B?TzNoam16elAxTnIwb2xkcEZJK3VjZE9pVjFpZDJNYWV5bDYvZFk3a09oa3p1?=
 =?utf-8?B?Z1dIbVhHQm9UalZLK2tMOFJQZ0daT2dmT0pLbjAxQmZlamU1cmxNeW9VcHBK?=
 =?utf-8?B?L0ExaDFwMEd5ckRtdVhHUlliY0FDOTJ6ZGRnMXdybG1uUXFQSTJMdFhLR0Fl?=
 =?utf-8?B?YWZqQ1Fzb1JHcms3ajk0anZXOXEwR1JJY1pNZ1drcTExTkpSN1E5R21zKzVx?=
 =?utf-8?B?RnQ1Y21pRlhad0RkMStTc1ZPSmxmOTR6VTljNzZKTU9nVUQzRW1oZU0yRWZl?=
 =?utf-8?B?ZGZ3VFBLV1ExUWpRbEx2bGtGOGRDaXJ3OXVzRDY2MFZyOWxoUURLSnBtYkpF?=
 =?utf-8?B?d1daTzhJdkh3QkY3UVdHVHE0SFhDY3ZmQ1llOTJCTVRSSjFwMlJMNlEzeUdm?=
 =?utf-8?B?ZWVnNFNNUU9DTHRZZ2Jxb2tPYTJ4cnF0dFo5NmlZUnYreEQvbkFnSXhJRUVB?=
 =?utf-8?B?aU1ZUUlITlJmM2F0VE9jbjBEUXd5VWVTYUpaK3MvN29rbVJ2UlRiT3BpdW54?=
 =?utf-8?B?QkdBQjN3T0RRU1RWRG5YK1VYQmhCNjhhNStsYU96Zi82amVJZmVlN1VDU0pW?=
 =?utf-8?B?MjRoS3JMbnBxUUgrcnlyNjdrK1p2WVFldkt6SDB1OFlsR054UVJUTXR0MUhO?=
 =?utf-8?B?QjZDdVNiVXU4aExaeU1wNVhjMXFEVWlCTEdlQTdsNkVINnRVaWRwbURublJR?=
 =?utf-8?B?MmR2a1FYcWZFMzljUFZrMXQyVWgveXl2MUV0T0U3YjNaTXFyZFpFczRKSUNB?=
 =?utf-8?B?ZWQzMFh0azNrNVF4WWJYZlE0QWl0eHVCVURGYzhOaDl6cVRjVVR3UVlhemdO?=
 =?utf-8?B?bGZsT3V3VzJRTGRINE5MWXp2UG1QWEhUL0ZibjJUcVBRdHYyUW5wR295TnJD?=
 =?utf-8?B?UHovYjduT1FJK01tVXJJYndEZFAzckxGcFpHTnFnQVUyRktFKy9ZekN1eUp1?=
 =?utf-8?B?ZzJQRzJvNGVQZGZ3SVNaQm9TUW84Vm8yRnVSSzJtbDE2L2plTWtTUzNrL1Mw?=
 =?utf-8?B?Y1lFSm9FTDBWdEdPazVUdzUyaHJ5N2RFQWJjZ21sNVZLYW9NbTVPSDlFMXBM?=
 =?utf-8?B?MW9TMEpmdWxnTXhvYzMwRGlLRktUL0ZLRDk3Um50aFlBTkMzY3V2VlRYSTBR?=
 =?utf-8?B?YVdneUt2T0NwNHZXNHlsanZtOUw3SExiMndOc2F6cEF0cVdGellGTllGZkE4?=
 =?utf-8?B?U2FHVzlqZ3pMZ3FpWmlMQVJNWnc5WlVOMzAvMDJkeUtmenhaZzFKMmRsalRZ?=
 =?utf-8?B?ekgwODRqdkpLMFZiV2tZbmFNTk1UTlh1WWdwUytMeXZ1WHN6MkdWZ1BycTNj?=
 =?utf-8?B?Z1FMS21lWm1kRGt3UDVYWG90OExxNEFEbzQ0YkNobzFXUFJ5akppVWhDZy83?=
 =?utf-8?B?OEgxYW9BVGhDMUhOKzFQOTRIRVR4UVk1R1BpT011cjJWUUUzTEFYWWhaOUhH?=
 =?utf-8?B?NVRTZmc4MU1adnJPWjFLUHRGVisrWUJrOGNITXZQYlkvbWZXNS9iUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8bb990-087c-443a-366a-08de62c30a85
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:24:57.0983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0hGYw5qQ9RcjDTfPnfAsSDW+3CALNhrem1KQIFDPuw3SLBg8cAFNTtBVNwuF91wMIhV/DeJk+xPpFw2T1w27A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7511
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

Thanks the change looks good to me. Reviewed-by Vitaly Prosyak  <vitaly.prosyak@amd.com>

On 2026-02-02 00:07, Tessita Thomas wrote:
> VCN JPEG (VCN 4.0.5+) requires IB size to be aligned to 16 DW
> (ib_pad_dw_mask = 0xF) according to hardware specification. The
> current test does not align the IB before submission, which can
> cause failures.
>
> This patch adds IB alignment logic in amdgpu_cs_jpeg_decode():
> - Validate initial IB count is even (required for 2-DW NOP packets)
> - Pad to 16 DW alignment using 2-DW NOP packets (0x60000000/0x00000000)
> - Add capacity checking to prevent IB buffer overflow
> - Add assertions to catch alignment violations early
>
> This ensures the test properly aligns IBs before calling submit(),
> demonstrating correct usage pattern for VCN JPEG submissions.
>
> Signed-off-by: Tessita Thomas <Tessita.Thomas@amd.com>
> ---
>  tests/amdgpu/amd_jpeg_dec.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/tests/amdgpu/amd_jpeg_dec.c b/tests/amdgpu/amd_jpeg_dec.c
> index ed005b3a1..f0876bfe1 100644
> --- a/tests/amdgpu/amd_jpeg_dec.c
> +++ b/tests/amdgpu/amd_jpeg_dec.c
> @@ -193,6 +193,22 @@ amdgpu_cs_jpeg_decode(amdgpu_device_handle device_handle,
>  		send_cmd_target(context, dec_buf.addr + (size / 4), &idx);
>  	}
>  
> +	/*
> +	 * VCN JPEG (VCN 4.0.5+) requires IB size aligned to 16 DW.
> +	 * We pad using a 2-DW NOP packet, so the initial ndw must be even.
> +	 */
> +	/* IB capacity in DW (IB_SIZE is in bytes, divide by 4) */
> +	unsigned int ib_dw_capacity = IB_SIZE / 4;
> +	igt_assert_eq(idx & 1, 0);
> +
> +	while (idx & 0xF) {
> +		igt_assert(idx + 2 <= ib_dw_capacity);
> +
> +		/* 2-DW NOP packet for VCN JPEG */
> +		context->ib_cpu[idx++] = 0x60000000;
> +		context->ib_cpu[idx++] = 0x00000000;
> +	}
> +
>  	amdgpu_bo_cpu_unmap(dec_buf.handle);
>  	r = submit(device_handle, context, idx, AMDGPU_HW_IP_VCN_JPEG);
>  	igt_assert_eq(r, 0);
