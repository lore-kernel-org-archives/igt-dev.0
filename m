Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E2FCD5BD5
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 23:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DCA10E6FC;
	Tue, 26 May 2026 23:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yMOiLTi2";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011038.outbound.protection.outlook.com [52.101.52.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C6A10E6FC
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 23:18:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlbkvO9Xjvk7lGvs0BxQpJo5OYyaGyiiHmFVBiz8U/UxiFL0ey3z2q8grqZa9g3a0OV4ItrD2oHrGq5NYRXrmR/FCRcnoLn+yWCcAMYLzIaPlcpRUzVIt338cn9qWVzTosUhE/L67uTtbc5YS8SDiJvCizsPtKDMsDnC+MvUlnn3hV6n7kOUjN1IPe3RiT6A+5Hg12MxVpPxtPNOlK0+CkqH9NRBhnpivSadUA+ziYlVP5tEbcl8IgcKthnOKW3u29KvUFaBeWALXfs7Hi5sbkS8vxyI/Vf0gUvzUiKabMnrjkZV7c6VcE3v1FNMUvcZenmsJ7/pd/wWJ+1IbY6gNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXiixb8EGJmWP65JO8gDFanOt4AkbrE9jyAlfPC2C0k=;
 b=V3NUchpmsM1onZG6iCNWFRpMYVb77xCekHDLBOv89YUkjIcnM4+Df1LFMjeNaXA83cJNt615mfe9xI7OkgyIakj8LaKduEr3MaCa0v4ULl1h3Ku9S2xl7t2bF+FuvaKouLpfGrXUJStYOIbDVZXdUAaISQfSyH0b6maTbMBvrW4dxPrryM0Qj1b7oAd3SQ9gFoDKJhmMhNkCpYtyaby5GktS2MUj8QhoUZ2oIxIDmzCWz4M2R9mupuIVMQmSjRLmbeOrgULgaSpHQBYiLCvyexx/wL5W8VRL2YxfXh8/IfgYusKEGatzK7pvIl7z6ATAqnRFPdnK26U0E0Fb/xseKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXiixb8EGJmWP65JO8gDFanOt4AkbrE9jyAlfPC2C0k=;
 b=yMOiLTi2ktlftykn1NIRbTS9uvjNSs6FEdjGPyKf/XWF5cOxtW+5ict/ETZVtjmgGsLuvoffCvX349BA4/fI0Nn2m1vWJVpjHUS7W/xIeJFzP+/Rd2SahXfTkKuVx5yueR7TlMeH9CmtokiQknXrND8Tq5tg8CbGCp0f72bhos8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA0PR12MB8085.namprd12.prod.outlook.com (2603:10b6:208:400::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 23:18:37 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0071.010; Tue, 26 May 2026
 23:18:37 +0000
Message-ID: <fd620b8d-8f9a-4b8f-8325-e9602e3e17c9@amd.com>
Date: Tue, 26 May 2026 17:18:33 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/2] test/kms_colorop_helper: don't requests colorop
 updates indefinitely
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>
References: <20260526140752.503380-1-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260526140752.503380-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:303:b7::33) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA0PR12MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: f2d2e723-4bbe-4675-ef56-08debb7d1cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|22082099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 9qFfAn1Gz+UC1jR+U1ehhloesveJRLs1pdYu3GYLKOAiB+58fG0bTZD7ip9WyyXpv0XcSic9t227yfbvcqKPvHmNdwKdXnKaw+6QYEOBsosXUK00yv87pBkRo7TOJG9h0SlfyxTE4EmsxjzP7jVMp6SZDF1w+J7c+rdM9c2WHyQfry73IzpSv7QFReSMg9ff4QDN6u43GRdutgQYPJSCgS0uH7K3HHl/zCFabbvlqYWGBlfR+oWWoo6XqjdXKmA/yL4IMJqUIwGj+o2IEXdCDWg0RadXhvd5btPWUChPIJ78Bz1/El72951En1y0c4DnIZfr1pnEOLEy1FXMLvqATFDoLnBqXQURLXdHQwE61P+ol62zO4oCxV52+64nKtGv15NxldadNJRTNE2u4ujWj0pdXLG+zfKZSn27PpmC+egrqd5TpVecFPAaZM+gmxWVhwnEN/6pEaCvCs2BChwysjYgQGfGP6NgN4paa8QNaOIS7JT4FSUbiYshP1Y6Kmt9PDzhYcqOZ3kKOPyLyF9IvBAHmjFNSoUoKMvxkdrpmVsHSwyJ+zRVWWwy31MMexowKM+rWLj2NjAiGT6Ptrh9TXNoKn6i88FpVRncPBh0xKa/shHdfphPk9HVEIStrAfGZUPww80NQhgMxTJirq4PIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(22082099003)(56012099006)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEpESGpzcEdsWjZaZ2FzVHJEaC9GREJNWHdOa0lkMmNDcjNRaVNPc2RNTVVz?=
 =?utf-8?B?M09jZG9qNm1ydU95MklXRUc0dnQwcU05dkV5Z2V1U1NpbHExU0ZYei9DaXcy?=
 =?utf-8?B?Y3Y2OUdaTU9qaHNRaVpkSldDclNRUThmZjN2eWlYZXNsL0dwTkRsd0xwVXZN?=
 =?utf-8?B?OXRDZ1hJM1JHYUQ0M3Q0UEQwdU9Ud0ZJbEpPMGpMS3B6V3hTZ3RpK3dSTmxC?=
 =?utf-8?B?R2ZMWGZVenMxR2h3eWFLeGpML0ltRk5WR1RiNUZjS1pzdDN2a0hpNU5nSWRS?=
 =?utf-8?B?dWxBaVUxRU11QzJISWxnakJ0UHRwanJFOWJGb0VwODJ4Nm5ERFZxYnJUemtL?=
 =?utf-8?B?ZjFCU2taWU9zbFlKZXdvUnMxSWNEc21Falo4RkVpaHFPeStpcWkrTFk3WkxH?=
 =?utf-8?B?UzZSdzhBU0l6ZWMzRExWaHQxSFcxVDRMMExYWWxtMktYVCtKWVp3OWVFQjk1?=
 =?utf-8?B?MmpxUkFWbVNDaTJXc1lMbDdONUFhVjNMQnFNSElzd0VOUkpTclVBTnpVWEJ2?=
 =?utf-8?B?VXkvbWZoOXkzejFBM2FwbE9rMm4rYWl5MVVSVUNGclRncW1kZCtSS3lYWmVm?=
 =?utf-8?B?OGpSaXgzb0t5SlFzQW8zcDZuMDZkTEpLdjZCcXBDYTZ6T1FSQVY1cFB5UGFV?=
 =?utf-8?B?TVdLVVNSUkxGNHpkQlVBWnNmdDhPMDNzd05jQ29sNkkxTnU1YkVxcGJkMEh6?=
 =?utf-8?B?UnJsb0Zjb1ZUM2JtcFp2ejBRUmR5TnBTWGlZTGpBcDVBK3VNcWhRREFkZEp3?=
 =?utf-8?B?QXhUUVRTMUx2MGZSdlZSUHJqVXc0eDNWTEhQN1BuRnh0YXVTT3prWWhqODRn?=
 =?utf-8?B?MU5lSmNQL1hxaTV6b2RqRlA2SHg3d2tjd3pIYmNtTm9wamlHWi9pMkoxKzBy?=
 =?utf-8?B?S0VrUFhhZFJFMHVhaDFqR2VUOHc2c01Hc21ya2RmQkFNS1loWTQwY0d5U2Z2?=
 =?utf-8?B?ZGJTeUdXamgxOW03RTVmcUFxTVViVlhtczBSc1JGcHNsM1lEUVU0VTdSZEVC?=
 =?utf-8?B?bHMwWi8vRmE2Z2FRUUhyTjU3djhXa0lyU1dFa2Y5SDMxcFRMbWJTTndNVDFU?=
 =?utf-8?B?bFJLQi9Zbkh3MkdPSlRDT3BGbVVwRjRZV3dBK2tGbGlaR3BrQUllK2R0bDQz?=
 =?utf-8?B?S1REeFU1T0swRG5vQndwZ2U3VlA3dGtBZTdlazM1SmFjZlRWcTJWRGNIUWcz?=
 =?utf-8?B?cDBFYXNHa0ZxaG1kY0doSm5UQTlBcFNQRlVXWUVqc3ZMREVSNHAwZUxtQUxq?=
 =?utf-8?B?ajVVVDNuVndabnlTZGdJUVBDL3hvTVNob3Z3NzBWVGs3MTh0MjdUQlljWFFB?=
 =?utf-8?B?anppWTJUQUpGRU9tYUt1ckw4Q2ZzNWpZZjVEVCsyc1FaUTFRaW9YUDZFdi9Q?=
 =?utf-8?B?cXhtdmRFRzNYam5hUEczb294RzVHV0dtOVhVMGJHaTFkd3FYdzlHRGJOeFQw?=
 =?utf-8?B?c2gyc2xWT1Vlb2hhWkVOczdLY3R0SnZSdHEwZ2dJc3lweU9KNnVPT0dwUTZD?=
 =?utf-8?B?azF5VjEySXpCaU9ZbUFRWFpZQXNERitLd3pVV3MzazIwejd6YzRhWDdzcGVB?=
 =?utf-8?B?STFRdGZUamtHM0kwYVlCQUN5aGZlYWtsOFNlQTFvdWRQanlLMCtKalRuMU5q?=
 =?utf-8?B?WVhETEdyNFVMbnowcHQxTUREMWRhV3BlK21xWGtrc2JUTG80VSsxaEtGa0Vk?=
 =?utf-8?B?Z1M1cW8wTEZseU9oZG9xWTNxTWsxenUxbUZvZnRuQlpIL3FpTTlyUG9zdWRI?=
 =?utf-8?B?SjZNa0k1MGR5Q0I4SW96Q2ZUR2NLRS9IOGsxUThGSXpIT0xIV3BMeWpOOXNI?=
 =?utf-8?B?NGY0enNJT0JoRXVXTjFhMzJmYWZNVFB3WERrYjQ4eUg2dUc4aDAzcmNOS1la?=
 =?utf-8?B?VldVTHVOVThqdy9VdE94eHBud2lrSXJJUGtOTlNZZmMzaVhMcFBsTlpWMzJG?=
 =?utf-8?B?WVVrbStBSzBIVm5WclY0Qk0xTElNMXlIa2psSDJXZUZVN0h2Wk52MUc2OVhX?=
 =?utf-8?B?SWlKN1R2RUNISDF6ZDRWcWJOY1JETXU3d05Xd1lycHppNjluenNFQVNNSFVv?=
 =?utf-8?B?WG5HLzBmYVVvdlA5SkRscFFxd2tDQTd3aU1LUEJhWkhQZjRuRS9rMjFqWWkr?=
 =?utf-8?B?ZytyMWgxbjRNMUZmMHFwa09ZWkowcEtTWXpOS1hsV0VOY3UvY0dNeW4zdFcw?=
 =?utf-8?B?eUJFQXFyczNxWDJ1ekFDcVJtcS9IUXp6TWZrWXNHcWQrSDBGdDFqVkE4bkY3?=
 =?utf-8?B?ZWlUUjVUTmcwTEVQRE5RdmxRS2VpSGptRFJKL2wxZ0ZLTkMyZ0xlSjhPRkhy?=
 =?utf-8?B?UE90OFI3V2VreklmaGZqUGhmaW1UNjNBODJOT1o1ZnVmRXJtd3FZZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d2e723-4bbe-4675-ef56-08debb7d1cce
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 23:18:36.9001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYKO6YbVd5/uTXbg22JBfFPcRZ4y7xzt75X8M7GmX1j/hBibq0+NByUtMqA1cJizsfPRuD9dZKm7Av1E+M4KNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8085
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

It works after kernel applies 
https://lore.kernel.org/amd-gfx/20260526142940.504911-1-mwen@igalia.com/T/#m917e6bb6e0fd73775717fce176f88aa3b0becb72

Tested-by: Alex Hung <alex.hung@amd.com>

On 5/26/26 08:05, Melissa Wen wrote:
> After committing colorop settings, colorops are still flagged as
> changed, even if there is no new request for updates. The first patch
> clear colorop flag after commit so that the next patch doesn't try to
> re-submit changes on inactive color pipeline. The second patch prevents
> colorop to be marked as changed just because it was checking if a
> property enum value is supported.
> 
> These changes are consistent with the current expecation of allowing
> property changes in colorop that are part of a current active color
> pipeline or a color pipeline that will be activated or deactived in the
> same atomic commit; but rejecting attempts to change inactive colorops.
> 
> Lemme know your thought!
> 
> Melissa
> 
> Melissa Wen (2):
>    lib/igt_kms: clear colorop-changed flag after commit
>    test/kms_colorop_helper: only check if a given enum value exist
> 
>   lib/igt_kms.c              | 41 ++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h              |  4 ++++
>   tests/kms_colorop_helper.c |  4 +++-
>   3 files changed, 48 insertions(+), 1 deletion(-)
> 

