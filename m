Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F730D1268B
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 01:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DD510E051;
	Wed,  3 Dec 2025 01:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2dDRHaGE";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011052.outbound.protection.outlook.com [52.101.62.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E904A10E051
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 01:34:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNKg3SQ6gfFBnfv9YH4TWIVaXdc6ZgYpZcZZxH6V9d23zO97GjVfxdFZNiOckbpi3no8UALBdbXadwbjXrZU0W4aF3yT9U6jrzF+6J8jGOrBjUf26Szxdmzk+hxsvzj4eRSeGWTuVqZioF0XiCPj4kr7r6P9dbkwaEQ5IaGRLc3ldn3Gk+6Skq5NAL2qUMtMIcdlUTA8ymu5bVpAgN4PVzTPa9WvuycfZPPw4RC0s//tLOhh8UkqgHEz7Xs9C5rnmecxBDADDr+KCZR2pdKWao3cWcyOt9Joi81aenSMPRU8t1RTqGYLkk9D/WoCsVA5/WZNnsbwlo8UktIZqEBD7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fTGZwo3SMFL1aSXnRdCMSbhnux4qOHwj5b//jN1+4Y=;
 b=BD1TDV/omTk3QwpSUmJYUEOekzI1P5ACRFuspbZTFVUjBbpPH3DA3hvmDwDR2l0LhpyZQFSJsKKRGM7nCFRLkFo64kHMv3w4FhOm2d+HbTDinNJvRrKAVt//d+Vihzk66612WzAORanCpyprDwJ0f78GkFLoDZQB3R++LJBpMX/jo2FWDGCB016SeOnIXRBMDnBZfCBlygw4MNe4euI2uQM0eI3j3npq1fb5ufhPr08DwAC8K0fwzYiw4dSx1lXA0jmlVZX1OjYPk/4VNydDmrmfth/f4R0fg8DoGDWyrhGOrsRUUjFsSnMJrvNCWLkdoCfLfkgOs8uYPpvOoTqd7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fTGZwo3SMFL1aSXnRdCMSbhnux4qOHwj5b//jN1+4Y=;
 b=2dDRHaGEctSQAAsfCjZKeaJ9CYNucQT9EuLYcDnoWMG8gLlFwt8eIU4q2l8cIOKRGLS/VvGH6xv93Vz6YzUOS+O23t/eB5OorNuQxnNg1wFTBl8ayR4Cz/nW1s4jw6ATnkTNshDHaUQEemXSgAYvBFMTjRrG800FZ265dtRJ0bU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DS0PR12MB7702.namprd12.prod.outlook.com (2603:10b6:8:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 01:34:02 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 01:34:01 +0000
Content-Type: multipart/alternative;
 boundary="------------vf0x88LZ4bhPFoTHiFoHCJpv"
Message-ID: <98cf9001-04c0-43d1-bb5b-939e047e58a3@amd.com>
Date: Tue, 2 Dec 2025 20:33:58 -0500
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2=5D_tests/amdgpu/amd=5Fbo=3A_Add_UMQ-bas?=
 =?UTF-8?Q?ed_HDP_flush_VRAM=E2=86=92GTT_coherency_test_v2?=
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: igt-dev@lists.freedesktop.org, David Yat Sin <David.YatSin@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20251201185947.292015-1-srinivasan.shanmugam@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20251201185947.292015-1-srinivasan.shanmugam@amd.com>
X-ClientProxiedBy: YT4PR01CA0131.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::28) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DS0PR12MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: d7545691-2ae2-4a82-aa54-08de320c099a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUxvdWxKMEg4YWFyTDRXOENZT0dxR2FtbksxUE01Rk9BSzA5cXRmL3BEdnVu?=
 =?utf-8?B?OFVHZEFobzJaUG91MVVFVjdhaXBIeFpvQzcxZnVLcU5IVHZ2US85MlMvd3JS?=
 =?utf-8?B?b2VoZ1VSUjAzRmVhdktVMW41azcyZ1hUc2lYRzVUOFdHaldNQ1RwVThDc2d6?=
 =?utf-8?B?eVVyS0dRUVdrS3FVVm5pczlha29TRm5rWDdKSUZsd1o2elRTa2owZ1NTSzJP?=
 =?utf-8?B?Nm9rSmJaaTFsSWg0UFdwUUp3ZDJ5SnRIdDN3YkY1Snl2TlZuRFU0YkNUak9Z?=
 =?utf-8?B?RUdDY1NVZzdYdFhDdE5EdGs0Tnl3OThoRjJST05ZbnJWUzhLQzI4YVJBaVNL?=
 =?utf-8?B?T3h3NDBXcTBNeU8wUHdUNkVha1hFSjc3QnFNUzFlTzJpUU8xMmh2MjVaOFpa?=
 =?utf-8?B?UTFodkNhNkxtdHVZQ3hhaUR4N2Y3TEFFcGRlOUhCL3BRSUFXRTluY1V0NUUz?=
 =?utf-8?B?aWorTHpzNzBuNDJrVUhhbXBCc1RiRHBiWVVNTllWZzZXNkVZbmlKcWI2OEpy?=
 =?utf-8?B?ZG10QmhLeVArbWFFQkhOQ21uTnVZdlExMjQ4MWhNSENQdG1EeHRUL3ByeEdJ?=
 =?utf-8?B?WUVZUzMvL2dIc0VwTG5xQXg0NkdJWWwrUit5WGVORjI2WGlYTlNud3NuTUNG?=
 =?utf-8?B?MG45S05YZC9IdjdWWTRJdmp4YWpGclh4UVBCRHF6OElaZExYTzJpVzNudGZH?=
 =?utf-8?B?VDloenRYTXJvQXA4dXhlL3N0RkxzMW1xd3dDak5WTkgxNlR0cDNpMWZsN2I1?=
 =?utf-8?B?bUIxL2d2UWFXSERqQ2ZVbGFSOHA3eDNSZVROR01vOVJsejYyY1I1U0VIdTNS?=
 =?utf-8?B?MmlPMmdteU96cjJxMExwbWxmc1ZpNkNwaDByOUZPRlZWZWN3K2FZeFdUR2JQ?=
 =?utf-8?B?YWpsaE5uSVk1eTBsVkg0ZTA0Z0FKeUtXdkZiTXFLcnNldHNTUUc4Nk44S3ZO?=
 =?utf-8?B?alczTHNXN2VLRklCS0xPZ1pRS2p4SU9nQXROOVE0UnovTkp5WlJHZVZrU1hL?=
 =?utf-8?B?OFlkMG5qOElzbFZDS3d5a3pNMUR4cEUxZGJ4aTNudXhpcDNuY2IweFRMdDc4?=
 =?utf-8?B?M08xMlo4aHZFTUdvK0sxci84UkJJTisyNGJnWEJXdE80QmM5KzJrRTRkUjhX?=
 =?utf-8?B?TmR4OGU5TVJ5MW1OM2wvQzJzcXFXbndzbkQ1K25IdUp2cXBtL3B6M0Z0c084?=
 =?utf-8?B?bDZSQURZTzlBa0ZUeDJIK1dYS0ZURHRsVUpuR3dIaGZoN0NJY0NMN1BnQXhO?=
 =?utf-8?B?UmhheDFWTi8xdFh1NnYvbnBzMzNkVDlFRlB6OHRWMDBmUVhFU3NQMmsxSjBE?=
 =?utf-8?B?VHpzQ05IKzFFdDJiamdXNzBEQWtWYlp4blVHL3NPNVh0SGVoa2thNEhWaVJ0?=
 =?utf-8?B?b01JakpMTGlSaGFhSWdjamxWNjhlMTNBdUtaUCtjL0YzY1RuYWFwZkVDV2Z3?=
 =?utf-8?B?YUFGQ1FpdHhkcU4wQ29YandaMTg3Qy92K1BhdzBLRTdycnF3VzdOcWg0TkRZ?=
 =?utf-8?B?Z25IeUkvamlhbjIyUGdmdHpHcURFU3lXRGNIRXgrWWEwY2JiTUticzFRbmcr?=
 =?utf-8?B?RnFsWVUrTnd5dVNhUkJpL1NtNFE2bGFJYjVCa2dobGVZL0J0ZEIxSTlSaE9M?=
 =?utf-8?B?cnB5VUpzMU1WM1JaSG5ITHVRRWN4Ry95cFJ0UUNRL3gzWW9Na3hyNHBsVy9Y?=
 =?utf-8?B?a0svajhjRXhDb3VSdGw2ZFE0WjFMcU1uaEcxM2FlZ2E0U1pkbEJrT21Eckph?=
 =?utf-8?B?UWFxMS9ZMWdpZ2ZsaWJYK202NXpYY2xXbDM3WEEvNkYxOUxlOU90Q2hreGo1?=
 =?utf-8?B?T3NVWHhqMm5pZ0F3VHN6SndlLzR1aU00QktRRmVTRmxacDRwU01BK2ZPNXkx?=
 =?utf-8?B?QkpJc29PMDBEYklQQ2hrRFBjV0pMMVkxUXhpelExMGJRYVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHlZSm5BdzFMSDZWQ2ZsVVlKZ0dyWDNod1Y1aDZTL3B6NkMwZnFkR0p2UDAx?=
 =?utf-8?B?SEIwVldFK3lrVHYzcmNYVlEwdy9VbHVCczU5TWxweEgyZjlzbGhHUlQrL1VD?=
 =?utf-8?B?eDY0eXJzaFA5dHJXR3dHbjRNSE1pdzNENEQzQlNTbjRaczNMcFlFQll0ZWhx?=
 =?utf-8?B?WXVRZEZpM3JGRFl4c0hBYUtCQnpQbG4vUHlLemR5Q3F6UDhnV3g2MDE0WTZw?=
 =?utf-8?B?L0dIYXljZnc2ampPK3llYUZuWHJzUm5OTGdoMWZTaksxQ0JFS252QnQ2S1VN?=
 =?utf-8?B?SE5xaXo0eXgvam8xdllPdHpSYlp1T0NlYnpOYmNSZ3VrenBJakd5OUIvcVcr?=
 =?utf-8?B?eDE4WnF5SUhMb1AxSDhGMGoxNXFkMHJuK2pVOUFTbmlnanhXSmVYYlZmQWhC?=
 =?utf-8?B?ZmxXZ3o0a1QxL0ZBQnJqZnNzTldsSlRJaHBoK3JJcVY0S0hyMUwwVGZ4bkFO?=
 =?utf-8?B?a1c4dEsrL3lCbWpRbWxFaXhraEQvNTRlOFQvcHIzcGYyQXYwRTFjdjFER0Ry?=
 =?utf-8?B?a1FwOUlEL0lZdmdGd2ExSk1ONUI3aVJ6OHVubEQ3YXBESVdNT1pKL09MSkM1?=
 =?utf-8?B?Q2dxT2FFd0ZQUVZQWk4zMTQxeStmZWZtNDYvaWtITDlPSXVGV2tGQnNxUzdK?=
 =?utf-8?B?bWdEM3VJL2Fod09EenVqNG1LV3VvVHc4VUZOMWN2dkZwVU5qaGhXMjZtV1ZK?=
 =?utf-8?B?M0kvTkhXK1YySnNMME5neDV2MXNKM3FZV2FMTlVPQnluaUcxOTF5U1E3eVRL?=
 =?utf-8?B?elJYUmVOc1FvVXlkakMvM1g0T2NqaTF5czBqeVFYa0I3NVZ0NVNxa0Y5Y0N4?=
 =?utf-8?B?TjlKM1FpRSt3aGk4emxLOERuMDIweVpKU2N2bFRtaGZhMU5pTkxZV0h1MUNB?=
 =?utf-8?B?WFdWdFJsVXVnN3NFcHJPWnlTQ1orZ2ZENFRDTng3N004eEhTV0dCb2ZBV29C?=
 =?utf-8?B?amFPZnBTMXRoTE8yUWNFaWtZQ2UxR3kveXJZRGNTOGZJbnpzVnBXVzNpa0JS?=
 =?utf-8?B?clIwbHVFbTZ3cGsza1VLcUFFMGx3Z25uQWd2SDBnRXVpZDFGa0VleThRWjZy?=
 =?utf-8?B?eEF6VXpTdGpkY3g2WFNkb2ZSU2tFK3RnTkxKYkRYSnRIYjVNUzd2MXFCL1VU?=
 =?utf-8?B?cHpDd1RaMER2UzZGWEM1d2FudFNIWnduTGNtTVY0MWRNZUU3MDRGazA1OE8y?=
 =?utf-8?B?SnN0ZG0vWjFrQWZoYlBFY3JrKzdKMG1aNFlFU3RFbHFIdlZwUW9RYzRxNTFt?=
 =?utf-8?B?Q0M4YVJJV0hQcW5Uakw3YUduZUhncDB0RStrYllheWorelVxWGtmOC9uc2tI?=
 =?utf-8?B?cDNaRVBhTTZvQVkwbnpzTjltcllHcW1YbHJuL21SM20rbmhKbEdiVVp4NjdD?=
 =?utf-8?B?QllxN0tKVzhQN21KdjdlMmlFK1FMMnlYZ1J6SHVqRitxbGVHVjllZ1dCdEJN?=
 =?utf-8?B?Zk9FS0lrY283cWlpREZIV0dyclZBUTJtT21MRFFVN2RaZEFDUTBPWkx1TzY5?=
 =?utf-8?B?QUVuOEdZOVFQMU1LWUdKK3JjUjRqVTlKREFUWkQ4L1Z6Zkc2VndOWEhCeHVS?=
 =?utf-8?B?ZlN4ODBFa3pRbjZzeUhYMGVheVFZekhqKzVRcG9INnJuMnoyWDh5amNROGZK?=
 =?utf-8?B?Y3VaZU0xY2srRW8rQ01wSnZITHlEYXF1bk1xRERFV0kvRXhsR2V4aFpYdlpO?=
 =?utf-8?B?aFoySjFrT1huOWtVRjdZVkwxeTRtTE9tbE5ucDNQWWQ0N2tQekY5SlFEWUVj?=
 =?utf-8?B?cUpYRHlVaWE0Zll1UU5XaG1Wazk0dVhmM2FIcGZwbGFUeXlVOG5DWGtiUlpI?=
 =?utf-8?B?LzVoR1k4WjFJaWFjaWVqSkdFalJyTWxDUTVCdHEvVzByYS9OYS9LQklTc2Nt?=
 =?utf-8?B?WDYzRkxaVHAyTWhnWWlTNGlKdmF6eUFzajFYMk1LU1hDUUx0TzZHK0EwNUVO?=
 =?utf-8?B?WjROblRBZEdXdUZMc2wzTTg3M3cwcm5ORHA3eVp5UmJYVFRzWDlpTjlEL1BJ?=
 =?utf-8?B?YUQrbStUQzI3WGRUT0VDTTdTRlN2bkp6cVNVZWlobTV2YjVHazIrNnk1WHBO?=
 =?utf-8?B?L0ZYVEdoRzJ1QTNkZGtVMTl0cEs3K3pqTG01bk9zbytWcGpxc1JkNHViaml3?=
 =?utf-8?Q?SxTn0VNvrz7dR5El58bKgsYyz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7545691-2ae2-4a82-aa54-08de320c099a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 01:34:01.7565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aniIwFwstz77sA9n7httz5G5+RuIJPafYWMYNTR7dK2Bt5ylCQJXPm7pDcJQmobogQyuc9fb4kv00m6Ygkdv7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7702
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

--------------vf0x88LZ4bhPFoTHiFoHCJpv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Srini,

Thanks for the v2. The test looks good to me and the UMQ HDP flush flow is clear (PASS-A with flush vs PASS-B without flush). Function naming and logging also fit well with the existing amd_bo tests.

I have only a few small style nits:

Please keep the subject and commit message ASCII-only. In particular, replace the VRAM→GTT arrow with VRAM->GTT. Also, you don’t need the trailing “v2” in the subject since we already have the [v2] tag – something like:
Subject: [v2] tests/amdgpu/amd_bo: Add UMQ-based HDP flush VRAM->GTT coherency test

Thanks to Kamil for catching this in the first place.


There are a few lines that exceed 80 columns (some igt_info()/igt_describe() strings and one comment line). It would be good to wrap those to stay within the usual 80-column limit.

For example, igt_describe("UMQ HDP flush VRAM->GTT: PASS-A (with flush) and PASS-B "
         "(without flush) on SDMA (UMQ only)");

Optional nit: you could keep the new #include "lib/amdgpu/amd_command_submission.h" in alphabetical order with the other AMDGPU headers, but that’s purely cosmetic.

With those minor issues addressed, the patch looks good from my side.

Please address the comments from Kamil and Jani.

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Thanks,
Vitaly

On 2025-12-01 13:59, Srinivasan Shanmugam wrote:
> Introduce a UMQ-only coherency test that validates host HDP flush behaviour
> using MMIO_REMAP and a VRAM→GTT linear copy. The flow performs one PASS-A
> (with flush) and one PASS-B (without flush) to detect whether CPU writes
> propagate without an explicit HDP poke.
>
> v2:
>  - Move all local declarations to the top of their blocks. (Vitaly)
>  - No functional changes from v1; logic and test flow remain identical.
>
> TODO: A kernel patch enabling this path is pending merge; once it lands,
> the Link below can serve as the stable reference.
>
> Link: https://patchwork.freedesktop.org/series/153209/#rev5
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: David Yat Sin <David.YatSin@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> ---
>  tests/amdgpu/amd_bo.c | 296 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 296 insertions(+)
>
> diff --git a/tests/amdgpu/amd_bo.c b/tests/amdgpu/amd_bo.c
> index 2243eea04..3d16f78a8 100644
> --- a/tests/amdgpu/amd_bo.c
> +++ b/tests/amdgpu/amd_bo.c
> @@ -9,6 +9,7 @@
>  
>  #include "igt.h"
>  #include "lib/amdgpu/amd_memory.h"
> +#include "lib/amdgpu/amd_command_submission.h"
>  
>  #include <unistd.h>   /* sysconf() */
>  #include <string.h>
> @@ -366,11 +367,273 @@ amdgpu_mmio_remap_gem_create_close(amdgpu_device_handle device)
>  	igt_assert_eq(r, 0);
>  }
>  
> +/* Order CPU stores -> poke FLUSH_CNTL -> readback to post the write. */
> +static inline void hdp_flush_mmio(uint32_t *mmio_base)
> +{
> +	__sync_synchronize();
> +	mmio_base[MMIO_REMAP_HDP_MEM_FLUSH_CNTL / 4] = 1;
> +	(void)mmio_base[MMIO_REMAP_HDP_MEM_FLUSH_CNTL / 4];
> +	__sync_synchronize();
> +}
> +
> +/*
> + * UMQ HDP flush VRAM->GTT copy check (single-shot; UMQ-only)
> + *  - PASS-A: write pattern + tag 0x0000BEEF, HDP flush (if available) -> copy
> + *            expect dst[1] == 0x0000BEEF
> + *  - PASS-B: change tag to 0x0000FACE, NO flush -> copy -> report stale/coherent
> + */
> +static void amdgpu_umq_hdpflush_vram2gtt(amdgpu_device_handle device,
> +					 const struct amdgpu_ip_block_version *ip_block,
> +					 bool user_queue)
> +{
> +	const int sdma_write_length = 1024; /* bytes */
> +	const int pm4_dw            = 256;  /* dwords */
> +	struct amdgpu_ring_context *ring_context;
> +	bool userq_created;
> +	amdgpu_bo_handle mmio_bo;
> +	void *mmio_cpu;
> +	bool have_mmio_flush;
> +	uint32_t available_rings;           /* UMQ slots mask */
> +	int r;
> +	int ring_id;
> +	const char *ip_tag;
> +	/* moved out of inner scopes */
> +	struct amdgpu_bo_alloc_request remap_req;
> +	uint64_t src_flags;
> +	uint64_t dst_flags;
> +	uint32_t *src32;
> +	uint32_t *dst32;
> +	uint32_t got;
> +
> +	ring_context    = NULL;
> +	userq_created   = false;
> +	mmio_bo         = NULL;
> +	mmio_cpu        = NULL;
> +	have_mmio_flush = false;
> +	available_rings = 0;
> +	ip_tag = (ip_block->type == AMDGPU_HW_IP_DMA) ? "dma" :
> +		 (ip_block->type == AMDGPU_HW_IP_GFX) ? "gfx" : "ip";
> +
> +	ring_context = calloc(1, sizeof(*ring_context));
> +	igt_assert(ring_context);
> +
> +	ring_context->write_length = sdma_write_length;
> +	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
> +	igt_assert(ring_context->pm4);
> +
> +	ring_context->secure = false;
> +	ring_context->pm4_size = pm4_dw;
> +	ring_context->res_cnt = 2;
> +	ring_context->user_queue = true; /* UMQ-only */
> +	ring_context->time_out = 0;
> +
> +	igt_info("[umq-hdpflush][%s] start (user_queue=%d)\n", ip_tag, (int)user_queue);
> +
> +	/* Query UMQ rings/slots */
> +	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
> +	igt_info("[umq-hdpflush][%s] query_hw_ip_info: r=%d ip_type=%u avail_rings=0x%x\n",
> +		 ip_tag, r, ip_block->type, ring_context->hw_ip_info.available_rings);
> +	igt_info("[umq-hdpflush][%s] userq_slots=%u\n",
> +		 ip_tag, ring_context->hw_ip_info.num_userq_slots);
> +	igt_assert_eq(r, 0);
> +
> +	available_rings = (ring_context->hw_ip_info.num_userq_slots >= 32)
> +		? 0xFFFFFFFFu
> +		: ((1u << ring_context->hw_ip_info.num_userq_slots) - 1u);
> +
> +	if (!available_rings) {
> +		igt_info("[umq-hdpflush][%s][SKIP] no available UMQ slots\n", ip_tag);
> +		goto cleanup_top;
> +	}
> +
> +	/* Create UMQ context only */
> +	igt_info("[umq-hdpflush][%s] userq_create...\n", ip_tag);
> +	ip_block->funcs->userq_create(device, ring_context, ip_block->type);
> +	userq_created = true;
> +	igt_info("[umq-hdpflush][%s] userq_create done\n", ip_tag);
> +
> +	/* Map one MMIO_REMAP page to poke HDP flush */
> +	memset(&remap_req, 0, sizeof(remap_req));
> +	remap_req.alloc_size     = AMDGPU_GPU_PAGE_SIZE;
> +	remap_req.phys_alignment = AMDGPU_GPU_PAGE_SIZE;
> +	remap_req.preferred_heap = AMDGPU_GEM_DOMAIN_MMIO_REMAP;
> +	remap_req.flags          = 0;
> +	r = amdgpu_bo_alloc(device, &remap_req, &mmio_bo);
> +	if (!r) {
> +		r = amdgpu_bo_cpu_map(mmio_bo, &mmio_cpu);
> +		if (!r && mmio_cpu) {
> +			have_mmio_flush = true;
> +			igt_info("[umq-hdpflush][%s] MMIO_REMAP mapped: cpu=%p\n",
> +				 ip_tag, mmio_cpu);
> +		} else {
> +			igt_info("[umq-hdpflush][%s] MMIO_REMAP map failed r=%d; "
> +				 "continuing without flush\n", ip_tag, r);
> +			(void)amdgpu_bo_free(mmio_bo);
> +			mmio_bo = NULL;
> +		}
> +	} else {
> +		igt_info("[umq-hdpflush][%s] MMIO_REMAP alloc r=%d; continuing without flush\n",
> +			 ip_tag, r);
> +	}
> +
> +	/* Pick the first available UMQ slot and run once */
> +	for (ring_id = 0; (1u << ring_id) & available_rings; ring_id++) {
> +		src_flags = 0; /* NORMAL */
> +		dst_flags = 0; /* NORMAL */
> +
> +		ring_context->ring_id = ring_id;
> +		igt_info("[umq-hdpflush][%s] == ring/slot %d begin ==\n", ip_tag, ring_id);
> +		igt_info("[umq-hdpflush][%s] map combo: src=NORMAL dst=NORMAL\n", ip_tag);
> +
> +		/* SRC in VRAM (CPU writes go via HDP) */
> +		r = amdgpu_bo_alloc_and_map_sync(device,
> +						 ring_context->write_length,
> +						 4096, AMDGPU_GEM_DOMAIN_VRAM,
> +						 src_flags,
> +						 AMDGPU_VM_MTYPE_UC,
> +						 &ring_context->bo,
> +						 (void **)&ring_context->bo_cpu,
> +						 &ring_context->bo_mc,
> +						 &ring_context->va_handle,
> +						 ring_context->timeline_syncobj_handle,
> +						 ++ring_context->point, true /* UMQ */);
> +		igt_info("[umq-hdpflush][%s] SRC: r=%d bo=%p cpu=%p mc=0x%016llx\n",
> +			 ip_tag, r, (void *)ring_context->bo, (void *)ring_context->bo_cpu,
> +			 (unsigned long long)ring_context->bo_mc);
> +		igt_assert_eq(r, 0);
> +
> +		r = amdgpu_timeline_syncobj_wait(device,
> +						 ring_context->timeline_syncobj_handle,
> +						 ring_context->point);
> +		igt_assert_eq(r, 0);
> +
> +		/* DST in GTT */
> +		r = amdgpu_bo_alloc_and_map_sync(device,
> +						 ring_context->write_length,
> +						 4096, AMDGPU_GEM_DOMAIN_GTT,
> +						 dst_flags,
> +						 AMDGPU_VM_MTYPE_UC,
> +						 &ring_context->bo2,
> +						 (void **)&ring_context->bo2_cpu,
> +						 &ring_context->bo_mc2,
> +						 &ring_context->va_handle2,
> +						 ring_context->timeline_syncobj_handle,
> +						 ++ring_context->point, true /* UMQ */);
> +		igt_info("[umq-hdpflush][%s] DST: r=%d bo2=%p cpu2=%p mc2=0x%016llx\n",
> +			 ip_tag, r, (void *)ring_context->bo2, (void *)ring_context->bo2_cpu,
> +			 (unsigned long long)ring_context->bo_mc2);
> +		igt_assert_eq(r, 0);
> +
> +		r = amdgpu_timeline_syncobj_wait(device,
> +						 ring_context->timeline_syncobj_handle,
> +						 ring_context->point);
> +		igt_assert_eq(r, 0);
> +
> +		/* Init buffers */
> +		memset((void *)ring_context->bo_cpu,
> +		       ip_block->funcs->pattern,
> +		       ring_context->write_length);
> +		memset((void *)ring_context->bo2_cpu,
> +		       0,
> +		       ring_context->write_length);
> +		ring_context->resources[0] = ring_context->bo;
> +		ring_context->resources[1] = ring_context->bo2;
> +
> +		/* Tag for PASS-A */
> +		src32 = (uint32_t *)ring_context->bo_cpu;
> +		dst32 = (uint32_t *)ring_context->bo2_cpu;
> +		src32[1] = 0x0000BEEF;
> +		igt_info("[umq-hdpflush][%s] PASS-A tag: src32[1]=0x%08x\n", ip_tag, src32[1]);
> +
> +		/* Build copy PM4/IB */
> +		ip_block->funcs->copy_linear(ip_block->funcs, ring_context,
> +					     &ring_context->pm4_dw);
> +
> +		/* WITH HDP flush if available */
> +		if (have_mmio_flush) {
> +			igt_info("[umq-hdpflush][%s] PASS-A: HDP FLUSH\n", ip_tag);
> +			hdp_flush_mmio((uint32_t *)mmio_cpu);
> +		} else {
> +			igt_info("[umq-hdpflush][%s] PASS-A: NO HDP flush available\n", ip_tag);
> +		}
> +
> +		/* Submit and verify PASS-A */
> +		amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
> +		got = dst32[1];
> +		igt_info("[umq-hdpflush][%s] PASS-A dst32[1]=0x%08x (expect 0x0000BEEF)\n",
> +			 ip_tag, got);
> +		if (have_mmio_flush)
> +			igt_assert_eq_u32(got, 0x0000BEEF);
> +
> +		/* PASS-B: change only the tag to 0xFACE, NO flush */
> +		src32[1] = 0x0000FACE;
> +		igt_info("[umq-hdpflush][%s] PASS-B tag: src32[1]=0x%08x (NO flush)\n",
> +			 ip_tag, src32[1]);
> +
> +		ip_block->funcs->copy_linear(ip_block->funcs, ring_context,
> +					     &ring_context->pm4_dw);
> +		amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
> +		got = dst32[1];
> +		igt_info("[umq-hdpflush][%s] PASS-B dst32[1]=0x%08x "
> +			 "(expect 0x0000FACE if coherent w/o flush)\n",
> +			 ip_tag, got);
> +		if (got != 0x0000FACE)
> +			igt_info("[umq-hdpflush][%s] PASS-B: STALE (saw 0x%08x)\n",
> +				 ip_tag, got);
> +		else
> +			igt_info("[umq-hdpflush][%s] PASS-B: MATCH without flush\n",
> +				 ip_tag);
> +
> +		/* Free once and break (single-run) */
> +		amdgpu_bo_unmap_and_free(ring_context->bo,
> +					 ring_context->va_handle,
> +					 ring_context->bo_mc,
> +					 ring_context->write_length);
> +		amdgpu_bo_unmap_and_free(ring_context->bo2,
> +					 ring_context->va_handle2,
> +					 ring_context->bo_mc2,
> +					 ring_context->write_length);
> +		igt_info("[umq-hdpflush][%s] == ring/slot %d end ==\n", ip_tag, ring_id);
> +		break;
> +	}
> +
> +cleanup_top:
> +	/* tear down */
> +	if (ring_context) {
> +		free(ring_context->pm4);
> +		if (userq_created) {
> +			igt_info("[umq-hdpflush][%s] userq_destroy...\n", ip_tag);
> +			ip_block->funcs->userq_destroy(device, ring_context, ip_block->type);
> +			igt_info("[umq-hdpflush][%s] userq_destroy done\n", ip_tag);
> +		}
> +		free(ring_context);
> +	}
> +
> +	if (mmio_bo) {
> +		if (mmio_cpu)
> +			(void)amdgpu_bo_cpu_unmap(mmio_bo);
> +		(void)amdgpu_bo_free(mmio_bo);
> +	}
> +
> +	igt_info("[umq-hdpflush][%s] end\n", ip_tag);
> +}
> +
>  igt_main
>  {
>  	amdgpu_device_handle device;
>  	struct bo_data bo;
> +	struct amdgpu_gpu_info gpu_info = {0};
> +	struct drm_amdgpu_info_hw_ip info = {0};
>  	int fd = -1;
> +	int r;
> +	bool arr_cap[AMD_IP_MAX] = {0};
> +	bool userq_arr_cap[AMD_IP_MAX] = {0};
> +	bool enable_test = false;
> +#ifdef AMDGPU_USERQ_ENABLED
> +	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
> +
> +	enable_test = env && atoi(env);
> +#endif
>  
>  	igt_fixture {
>  		uint32_t major, minor;
> @@ -383,6 +646,15 @@ igt_main
>  			 major, minor);
>  		err = amdgpu_bo_init(device, &bo);
>  		igt_require(err == 0);
> +
> +		r = amdgpu_query_gpu_info(device, &gpu_info);
> +		igt_assert_eq(r, 0);
> +		r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_GFX, 0, &info);
> +		igt_assert_eq(r, 0);
> +		r = setup_amdgpu_ip_blocks(major, minor,  &gpu_info, device);
> +		igt_assert_eq(r, 0);
> +		asic_rings_readness(device, 1, arr_cap);
> +		asic_userq_readiness(device, userq_arr_cap);
>  	}
>  
>  	igt_subtest("amdgpu_bo_export_import")
> @@ -409,6 +681,30 @@ igt_main
>  	igt_subtest("mmio_remap_map_and_poke")
>  	amdgpu_mmio_remap_hdp_flush_poke(device);
>  
> +	igt_describe("UMQ HDP flush VRAM->GTT: PASS-A (with flush) and PASS-B (without flush) on GFX (UMQ only)");
> +	igt_subtest_with_dynamic("umq_hdpflush_gfx_vram2gtt") {
> +		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
> +			igt_dynamic_f("umq-gfx-hdpflush")
> +				amdgpu_umq_hdpflush_vram2gtt(device,
> +							     get_ip_block(device, AMDGPU_HW_IP_GFX),
> +							     true /* UMQ */);
> +		} else {
> +			igt_info("[umq-hdpflush][gfx] skipping: UMQ disabled or GFX UMQ not available\n");
> +		}
> +	}
> +
> +	igt_describe("UMQ HDP flush VRAM->GTT: PASS-A (with flush) and PASS-B (without flush) on SDMA (UMQ only)");
> +	igt_subtest_with_dynamic("umq_hdpflush_dma_vram2gtt") {
> +		if (enable_test && userq_arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("umq-dma-hdpflush")
> +				amdgpu_umq_hdpflush_vram2gtt(device,
> +							     get_ip_block(device, AMDGPU_HW_IP_DMA),
> +							     true /* UMQ */);
> +		} else {
> +			igt_info("[umq-hdpflush][dma] DMA UMQ not available on this ASIC; skipping\n");
> +		}
> +	}
> +
>  	igt_fixture {
>  		amdgpu_bo_clean(device, &bo);
>  		amdgpu_device_deinitialize(device);
--------------vf0x88LZ4bhPFoTHiFoHCJpv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Srini,<br>
      <br>
      Thanks for the v2. The test looks good to me and the UMQ HDP flush
      flow is clear (PASS-A with flush vs PASS-B without flush).
      Function naming and logging also fit well with the existing amd_bo
      tests.<br>
      <br>
      I have only a few small style nits:<br>
      <br>
      Please keep the subject and commit message ASCII-only. In
      particular, replace the VRAM→GTT arrow with VRAM-&gt;GTT. Also,
      you don’t need the trailing “v2” in the subject since we already
      have the [v2] tag – something like:<br>
      Subject: [v2] tests/amdgpu/amd_bo: Add UMQ-based HDP flush
      VRAM-&gt;GTT coherency test</p>
    <p>Thanks to Kamil for catching this in the first place.</p>
    <p><br>
      There are a few lines that exceed 80 columns (some
      igt_info()/igt_describe() strings and one comment line). It would
      be good to wrap those to stay within the usual 80-column limit.</p>
    <p>For example, igt_describe(&quot;UMQ HDP flush VRAM-&gt;GTT: PASS-A
      (with flush) and PASS-B &quot;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;(without flush) on SDMA (UMQ only)&quot;);</p>
    <p>Optional nit: you could keep the new #include
      &quot;lib/amdgpu/amd_command_submission.h&quot; in alphabetical order with
      the other AMDGPU headers, but that’s purely cosmetic.<br>
      <br>
      With those minor issues addressed, the patch looks good from my
      side.</p>
    <p>Please address the comments from Kamil and Jani.<br>
    </p>
    <p><span><span class="ui-provider ed ft bhx bvj bvk bvl bvm bvn bvo bvp bvq bvr bvs bvt bvu bvv bvw bvx bvy bvz bwa bwb bwc bwd bwe bwf bwg bwh bwi bwj bwk bwl bwm bwn bwo" dir="ltr">Reviewed-by: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a></span></span></p>
    <p>Thanks,<br>
      Vitaly<br>
    </p>
    <div class="moz-cite-prefix">On 2025-12-01 13:59, Srinivasan
      Shanmugam wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251201185947.292015-1-srinivasan.shanmugam@amd.com">
      <pre wrap="" class="moz-quote-pre">Introduce a UMQ-only coherency test that validates host HDP flush behaviour
using MMIO_REMAP and a VRAM→GTT linear copy. The flow performs one PASS-A
(with flush) and one PASS-B (without flush) to detect whether CPU writes
propagate without an explicit HDP poke.

v2:
 - Move all local declarations to the top of their blocks. (Vitaly)
 - No functional changes from v1; logic and test flow remain identical.

TODO: A kernel patch enabling this path is pending merge; once it lands,
the Link below can serve as the stable reference.

Link: <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/153209/#rev5">https://patchwork.freedesktop.org/series/153209/#rev5</a>
Cc: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>
Cc: David Yat Sin <a class="moz-txt-link-rfc2396E" href="mailto:David.YatSin@amd.com">&lt;David.YatSin@amd.com&gt;</a>
Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a>
Signed-off-by: Srinivasan Shanmugam <a class="moz-txt-link-rfc2396E" href="mailto:srinivasan.shanmugam@amd.com">&lt;srinivasan.shanmugam@amd.com&gt;</a>
---
 tests/amdgpu/amd_bo.c | 296 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 296 insertions(+)

diff --git a/tests/amdgpu/amd_bo.c b/tests/amdgpu/amd_bo.c
index 2243eea04..3d16f78a8 100644
--- a/tests/amdgpu/amd_bo.c
+++ b/tests/amdgpu/amd_bo.c
@@ -9,6 +9,7 @@
 
 #include &quot;igt.h&quot;
 #include &quot;lib/amdgpu/amd_memory.h&quot;
+#include &quot;lib/amdgpu/amd_command_submission.h&quot;
 
 #include &lt;unistd.h&gt;   /* sysconf() */
 #include &lt;string.h&gt;
@@ -366,11 +367,273 @@ amdgpu_mmio_remap_gem_create_close(amdgpu_device_handle device)
 	igt_assert_eq(r, 0);
 }
 
+/* Order CPU stores -&gt; poke FLUSH_CNTL -&gt; readback to post the write. */
+static inline void hdp_flush_mmio(uint32_t *mmio_base)
+{
+	__sync_synchronize();
+	mmio_base[MMIO_REMAP_HDP_MEM_FLUSH_CNTL / 4] = 1;
+	(void)mmio_base[MMIO_REMAP_HDP_MEM_FLUSH_CNTL / 4];
+	__sync_synchronize();
+}
+
+/*
+ * UMQ HDP flush VRAM-&gt;GTT copy check (single-shot; UMQ-only)
+ *  - PASS-A: write pattern + tag 0x0000BEEF, HDP flush (if available) -&gt; copy
+ *            expect dst[1] == 0x0000BEEF
+ *  - PASS-B: change tag to 0x0000FACE, NO flush -&gt; copy -&gt; report stale/coherent
+ */
+static void amdgpu_umq_hdpflush_vram2gtt(amdgpu_device_handle device,
+					 const struct amdgpu_ip_block_version *ip_block,
+					 bool user_queue)
+{
+	const int sdma_write_length = 1024; /* bytes */
+	const int pm4_dw            = 256;  /* dwords */
+	struct amdgpu_ring_context *ring_context;
+	bool userq_created;
+	amdgpu_bo_handle mmio_bo;
+	void *mmio_cpu;
+	bool have_mmio_flush;
+	uint32_t available_rings;           /* UMQ slots mask */
+	int r;
+	int ring_id;
+	const char *ip_tag;
+	/* moved out of inner scopes */
+	struct amdgpu_bo_alloc_request remap_req;
+	uint64_t src_flags;
+	uint64_t dst_flags;
+	uint32_t *src32;
+	uint32_t *dst32;
+	uint32_t got;
+
+	ring_context    = NULL;
+	userq_created   = false;
+	mmio_bo         = NULL;
+	mmio_cpu        = NULL;
+	have_mmio_flush = false;
+	available_rings = 0;
+	ip_tag = (ip_block-&gt;type == AMDGPU_HW_IP_DMA) ? &quot;dma&quot; :
+		 (ip_block-&gt;type == AMDGPU_HW_IP_GFX) ? &quot;gfx&quot; : &quot;ip&quot;;
+
+	ring_context = calloc(1, sizeof(*ring_context));
+	igt_assert(ring_context);
+
+	ring_context-&gt;write_length = sdma_write_length;
+	ring_context-&gt;pm4 = calloc(pm4_dw, sizeof(*ring_context-&gt;pm4));
+	igt_assert(ring_context-&gt;pm4);
+
+	ring_context-&gt;secure = false;
+	ring_context-&gt;pm4_size = pm4_dw;
+	ring_context-&gt;res_cnt = 2;
+	ring_context-&gt;user_queue = true; /* UMQ-only */
+	ring_context-&gt;time_out = 0;
+
+	igt_info(&quot;[umq-hdpflush][%s] start (user_queue=%d)\n&quot;, ip_tag, (int)user_queue);
+
+	/* Query UMQ rings/slots */
+	r = amdgpu_query_hw_ip_info(device, ip_block-&gt;type, 0, &amp;ring_context-&gt;hw_ip_info);
+	igt_info(&quot;[umq-hdpflush][%s] query_hw_ip_info: r=%d ip_type=%u avail_rings=0x%x\n&quot;,
+		 ip_tag, r, ip_block-&gt;type, ring_context-&gt;hw_ip_info.available_rings);
+	igt_info(&quot;[umq-hdpflush][%s] userq_slots=%u\n&quot;,
+		 ip_tag, ring_context-&gt;hw_ip_info.num_userq_slots);
+	igt_assert_eq(r, 0);
+
+	available_rings = (ring_context-&gt;hw_ip_info.num_userq_slots &gt;= 32)
+		? 0xFFFFFFFFu
+		: ((1u &lt;&lt; ring_context-&gt;hw_ip_info.num_userq_slots) - 1u);
+
+	if (!available_rings) {
+		igt_info(&quot;[umq-hdpflush][%s][SKIP] no available UMQ slots\n&quot;, ip_tag);
+		goto cleanup_top;
+	}
+
+	/* Create UMQ context only */
+	igt_info(&quot;[umq-hdpflush][%s] userq_create...\n&quot;, ip_tag);
+	ip_block-&gt;funcs-&gt;userq_create(device, ring_context, ip_block-&gt;type);
+	userq_created = true;
+	igt_info(&quot;[umq-hdpflush][%s] userq_create done\n&quot;, ip_tag);
+
+	/* Map one MMIO_REMAP page to poke HDP flush */
+	memset(&amp;remap_req, 0, sizeof(remap_req));
+	remap_req.alloc_size     = AMDGPU_GPU_PAGE_SIZE;
+	remap_req.phys_alignment = AMDGPU_GPU_PAGE_SIZE;
+	remap_req.preferred_heap = AMDGPU_GEM_DOMAIN_MMIO_REMAP;
+	remap_req.flags          = 0;
+	r = amdgpu_bo_alloc(device, &amp;remap_req, &amp;mmio_bo);
+	if (!r) {
+		r = amdgpu_bo_cpu_map(mmio_bo, &amp;mmio_cpu);
+		if (!r &amp;&amp; mmio_cpu) {
+			have_mmio_flush = true;
+			igt_info(&quot;[umq-hdpflush][%s] MMIO_REMAP mapped: cpu=%p\n&quot;,
+				 ip_tag, mmio_cpu);
+		} else {
+			igt_info(&quot;[umq-hdpflush][%s] MMIO_REMAP map failed r=%d; &quot;
+				 &quot;continuing without flush\n&quot;, ip_tag, r);
+			(void)amdgpu_bo_free(mmio_bo);
+			mmio_bo = NULL;
+		}
+	} else {
+		igt_info(&quot;[umq-hdpflush][%s] MMIO_REMAP alloc r=%d; continuing without flush\n&quot;,
+			 ip_tag, r);
+	}
+
+	/* Pick the first available UMQ slot and run once */
+	for (ring_id = 0; (1u &lt;&lt; ring_id) &amp; available_rings; ring_id++) {
+		src_flags = 0; /* NORMAL */
+		dst_flags = 0; /* NORMAL */
+
+		ring_context-&gt;ring_id = ring_id;
+		igt_info(&quot;[umq-hdpflush][%s] == ring/slot %d begin ==\n&quot;, ip_tag, ring_id);
+		igt_info(&quot;[umq-hdpflush][%s] map combo: src=NORMAL dst=NORMAL\n&quot;, ip_tag);
+
+		/* SRC in VRAM (CPU writes go via HDP) */
+		r = amdgpu_bo_alloc_and_map_sync(device,
+						 ring_context-&gt;write_length,
+						 4096, AMDGPU_GEM_DOMAIN_VRAM,
+						 src_flags,
+						 AMDGPU_VM_MTYPE_UC,
+						 &amp;ring_context-&gt;bo,
+						 (void **)&amp;ring_context-&gt;bo_cpu,
+						 &amp;ring_context-&gt;bo_mc,
+						 &amp;ring_context-&gt;va_handle,
+						 ring_context-&gt;timeline_syncobj_handle,
+						 ++ring_context-&gt;point, true /* UMQ */);
+		igt_info(&quot;[umq-hdpflush][%s] SRC: r=%d bo=%p cpu=%p mc=0x%016llx\n&quot;,
+			 ip_tag, r, (void *)ring_context-&gt;bo, (void *)ring_context-&gt;bo_cpu,
+			 (unsigned long long)ring_context-&gt;bo_mc);
+		igt_assert_eq(r, 0);
+
+		r = amdgpu_timeline_syncobj_wait(device,
+						 ring_context-&gt;timeline_syncobj_handle,
+						 ring_context-&gt;point);
+		igt_assert_eq(r, 0);
+
+		/* DST in GTT */
+		r = amdgpu_bo_alloc_and_map_sync(device,
+						 ring_context-&gt;write_length,
+						 4096, AMDGPU_GEM_DOMAIN_GTT,
+						 dst_flags,
+						 AMDGPU_VM_MTYPE_UC,
+						 &amp;ring_context-&gt;bo2,
+						 (void **)&amp;ring_context-&gt;bo2_cpu,
+						 &amp;ring_context-&gt;bo_mc2,
+						 &amp;ring_context-&gt;va_handle2,
+						 ring_context-&gt;timeline_syncobj_handle,
+						 ++ring_context-&gt;point, true /* UMQ */);
+		igt_info(&quot;[umq-hdpflush][%s] DST: r=%d bo2=%p cpu2=%p mc2=0x%016llx\n&quot;,
+			 ip_tag, r, (void *)ring_context-&gt;bo2, (void *)ring_context-&gt;bo2_cpu,
+			 (unsigned long long)ring_context-&gt;bo_mc2);
+		igt_assert_eq(r, 0);
+
+		r = amdgpu_timeline_syncobj_wait(device,
+						 ring_context-&gt;timeline_syncobj_handle,
+						 ring_context-&gt;point);
+		igt_assert_eq(r, 0);
+
+		/* Init buffers */
+		memset((void *)ring_context-&gt;bo_cpu,
+		       ip_block-&gt;funcs-&gt;pattern,
+		       ring_context-&gt;write_length);
+		memset((void *)ring_context-&gt;bo2_cpu,
+		       0,
+		       ring_context-&gt;write_length);
+		ring_context-&gt;resources[0] = ring_context-&gt;bo;
+		ring_context-&gt;resources[1] = ring_context-&gt;bo2;
+
+		/* Tag for PASS-A */
+		src32 = (uint32_t *)ring_context-&gt;bo_cpu;
+		dst32 = (uint32_t *)ring_context-&gt;bo2_cpu;
+		src32[1] = 0x0000BEEF;
+		igt_info(&quot;[umq-hdpflush][%s] PASS-A tag: src32[1]=0x%08x\n&quot;, ip_tag, src32[1]);
+
+		/* Build copy PM4/IB */
+		ip_block-&gt;funcs-&gt;copy_linear(ip_block-&gt;funcs, ring_context,
+					     &amp;ring_context-&gt;pm4_dw);
+
+		/* WITH HDP flush if available */
+		if (have_mmio_flush) {
+			igt_info(&quot;[umq-hdpflush][%s] PASS-A: HDP FLUSH\n&quot;, ip_tag);
+			hdp_flush_mmio((uint32_t *)mmio_cpu);
+		} else {
+			igt_info(&quot;[umq-hdpflush][%s] PASS-A: NO HDP flush available\n&quot;, ip_tag);
+		}
+
+		/* Submit and verify PASS-A */
+		amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context, 0);
+		got = dst32[1];
+		igt_info(&quot;[umq-hdpflush][%s] PASS-A dst32[1]=0x%08x (expect 0x0000BEEF)\n&quot;,
+			 ip_tag, got);
+		if (have_mmio_flush)
+			igt_assert_eq_u32(got, 0x0000BEEF);
+
+		/* PASS-B: change only the tag to 0xFACE, NO flush */
+		src32[1] = 0x0000FACE;
+		igt_info(&quot;[umq-hdpflush][%s] PASS-B tag: src32[1]=0x%08x (NO flush)\n&quot;,
+			 ip_tag, src32[1]);
+
+		ip_block-&gt;funcs-&gt;copy_linear(ip_block-&gt;funcs, ring_context,
+					     &amp;ring_context-&gt;pm4_dw);
+		amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context, 0);
+		got = dst32[1];
+		igt_info(&quot;[umq-hdpflush][%s] PASS-B dst32[1]=0x%08x &quot;
+			 &quot;(expect 0x0000FACE if coherent w/o flush)\n&quot;,
+			 ip_tag, got);
+		if (got != 0x0000FACE)
+			igt_info(&quot;[umq-hdpflush][%s] PASS-B: STALE (saw 0x%08x)\n&quot;,
+				 ip_tag, got);
+		else
+			igt_info(&quot;[umq-hdpflush][%s] PASS-B: MATCH without flush\n&quot;,
+				 ip_tag);
+
+		/* Free once and break (single-run) */
+		amdgpu_bo_unmap_and_free(ring_context-&gt;bo,
+					 ring_context-&gt;va_handle,
+					 ring_context-&gt;bo_mc,
+					 ring_context-&gt;write_length);
+		amdgpu_bo_unmap_and_free(ring_context-&gt;bo2,
+					 ring_context-&gt;va_handle2,
+					 ring_context-&gt;bo_mc2,
+					 ring_context-&gt;write_length);
+		igt_info(&quot;[umq-hdpflush][%s] == ring/slot %d end ==\n&quot;, ip_tag, ring_id);
+		break;
+	}
+
+cleanup_top:
+	/* tear down */
+	if (ring_context) {
+		free(ring_context-&gt;pm4);
+		if (userq_created) {
+			igt_info(&quot;[umq-hdpflush][%s] userq_destroy...\n&quot;, ip_tag);
+			ip_block-&gt;funcs-&gt;userq_destroy(device, ring_context, ip_block-&gt;type);
+			igt_info(&quot;[umq-hdpflush][%s] userq_destroy done\n&quot;, ip_tag);
+		}
+		free(ring_context);
+	}
+
+	if (mmio_bo) {
+		if (mmio_cpu)
+			(void)amdgpu_bo_cpu_unmap(mmio_bo);
+		(void)amdgpu_bo_free(mmio_bo);
+	}
+
+	igt_info(&quot;[umq-hdpflush][%s] end\n&quot;, ip_tag);
+}
+
 igt_main
 {
 	amdgpu_device_handle device;
 	struct bo_data bo;
+	struct amdgpu_gpu_info gpu_info = {0};
+	struct drm_amdgpu_info_hw_ip info = {0};
 	int fd = -1;
+	int r;
+	bool arr_cap[AMD_IP_MAX] = {0};
+	bool userq_arr_cap[AMD_IP_MAX] = {0};
+	bool enable_test = false;
+#ifdef AMDGPU_USERQ_ENABLED
+	const char *env = getenv(&quot;AMDGPU_ENABLE_USERQTEST&quot;);
+
+	enable_test = env &amp;&amp; atoi(env);
+#endif
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -383,6 +646,15 @@ igt_main
 			 major, minor);
 		err = amdgpu_bo_init(device, &amp;bo);
 		igt_require(err == 0);
+
+		r = amdgpu_query_gpu_info(device, &amp;gpu_info);
+		igt_assert_eq(r, 0);
+		r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_GFX, 0, &amp;info);
+		igt_assert_eq(r, 0);
+		r = setup_amdgpu_ip_blocks(major, minor,  &amp;gpu_info, device);
+		igt_assert_eq(r, 0);
+		asic_rings_readness(device, 1, arr_cap);
+		asic_userq_readiness(device, userq_arr_cap);
 	}
 
 	igt_subtest(&quot;amdgpu_bo_export_import&quot;)
@@ -409,6 +681,30 @@ igt_main
 	igt_subtest(&quot;mmio_remap_map_and_poke&quot;)
 	amdgpu_mmio_remap_hdp_flush_poke(device);
 
+	igt_describe(&quot;UMQ HDP flush VRAM-&gt;GTT: PASS-A (with flush) and PASS-B (without flush) on GFX (UMQ only)&quot;);
+	igt_subtest_with_dynamic(&quot;umq_hdpflush_gfx_vram2gtt&quot;) {
+		if (enable_test &amp;&amp; userq_arr_cap[AMD_IP_GFX]) {
+			igt_dynamic_f(&quot;umq-gfx-hdpflush&quot;)
+				amdgpu_umq_hdpflush_vram2gtt(device,
+							     get_ip_block(device, AMDGPU_HW_IP_GFX),
+							     true /* UMQ */);
+		} else {
+			igt_info(&quot;[umq-hdpflush][gfx] skipping: UMQ disabled or GFX UMQ not available\n&quot;);
+		}
+	}
+
+	igt_describe(&quot;UMQ HDP flush VRAM-&gt;GTT: PASS-A (with flush) and PASS-B (without flush) on SDMA (UMQ only)&quot;);
+	igt_subtest_with_dynamic(&quot;umq_hdpflush_dma_vram2gtt&quot;) {
+		if (enable_test &amp;&amp; userq_arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f(&quot;umq-dma-hdpflush&quot;)
+				amdgpu_umq_hdpflush_vram2gtt(device,
+							     get_ip_block(device, AMDGPU_HW_IP_DMA),
+							     true /* UMQ */);
+		} else {
+			igt_info(&quot;[umq-hdpflush][dma] DMA UMQ not available on this ASIC; skipping\n&quot;);
+		}
+	}
+
 	igt_fixture {
 		amdgpu_bo_clean(device, &amp;bo);
 		amdgpu_device_deinitialize(device);
</pre>
    </blockquote>
  </body>
</html>

--------------vf0x88LZ4bhPFoTHiFoHCJpv--
