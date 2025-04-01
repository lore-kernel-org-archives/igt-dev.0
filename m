Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96956C36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 23:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CB989DFB;
	Tue,  1 Apr 2025 23:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qgLp2pn2";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6A989BAE
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 23:52:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXkjm4DvqoGWYZyoFmXDncvvki1WjXNmcVUgzEx0hvMoyK2ZjhDCYHZd6a5j1XmkMBDGoureSyeRw41y5arKFwS/db0yHQ22yKSLMCbZdrZo+6gOv1k6cuKkgDbYy8TTQre+fFtZUb9qvYzHd32CQGEY4LrDqkXDWpXEbO/p+wfVxSFzvnYUQDJYrSDjJgggVPAvDkse/4Psx98SDCJFUTn28ECYdLhtOrb5IZ2U2CI417C/1f57YrunB8g6kolKvROY+xRyBYeZib8CFtx6LO3h7UnvRoR2u85WUcDpZKM2njBtc8fCb77sVU2EgCFfPsI0A+Rt9Vpp0JSKKMI/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yO0+J+sf9zS4M2xfToPCsZ/zBY3/21QgTxE5rTHwXRY=;
 b=S/OpnMSJmmqj8RdGI2JNFgpl5cg617+vk4j+GCLVCD5qvvFclLOXAqX1WzkDG6oSiznzHwleBbp3NhreEYhUzW8FmG51c0SVB0jtZ5BYiYzwYgn4AyY5QLnryMrVXVSkHQiqAVGh4jpUaqx8LsAQIy3WyHZj6dm6HrvzIz5qZdbZ4TDfe/YTIy3rn1GiTa0IeMx0E7K+L3yABcPX7BbzN0NY3ahXb1Piy2AMCiId32eH/JnGLcdS0s/rikHqubb/BjcLUTkQDXhGgaoDnO1ZNjmjO9iQpNl1ED3qG+1Zk00nFE2Z0xiEtMqsQfKbBze4b61PdbYIlPg0CkEZeIlEAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yO0+J+sf9zS4M2xfToPCsZ/zBY3/21QgTxE5rTHwXRY=;
 b=qgLp2pn211gxG8uMllH0S2cqxTz65TRaxrjNnOmoy5aPGh66tIW7/SKt5rgbaK7qvuwcmLdQi4LEinUlL0gBkke1lNEq+sPKRRr+SyB7K5f3z1um8d1HwDw2yYe4E1ApNpgiYin9aE/CpFhYo+RBOtZ9WGk+e0FfWpYtmqMaFIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by BY1PR12MB8446.namprd12.prod.outlook.com (2603:10b6:a03:52d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 23:52:49 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 23:52:49 +0000
Message-ID: <1782e784-ee49-4f9f-b90e-fa7718f7276d@amd.com>
Date: Tue, 1 Apr 2025 19:52:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/19] drm-uapi/amdgpu: sync with drm-next
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>, igt-dev@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250328082416.1469810-1-sunil.khatri@amd.com>
 <20250328082416.1469810-13-sunil.khatri@amd.com>
 <20250401160634.pttztce2lrj2tver@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250401160634.pttztce2lrj2tver@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0226.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::26) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|BY1PR12MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: 558856cb-fcc5-4290-c47c-08dd71784ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWxoTUJzdlZQdWhhbnROR1Z6bWNYNE1Mc25UV0RPdVZpWGo5eXdPUWUvdzRa?=
 =?utf-8?B?blFhMS9QeXduNzNHUmNYM1Q5Sk5ScU5udTBIWnpZSDIvbS90Zm0wSEZhOVQy?=
 =?utf-8?B?NFZKTVdZZm1OSXlDb0hEcGRIQ3k0a0J2SVpKbnlmMHlvaW5kbElTMnZ3Vlov?=
 =?utf-8?B?dm9xQmYrVXNqdnVoc2hDZDNSOUtsK1Irb0t1bG5ZS3NweDJMR2VqRmRtTmV0?=
 =?utf-8?B?WWpBOUdYaThTM21xbkZKaHBVUndtRURnRVZYOE1pQ0E3N2R4RDU0aUtNWUhI?=
 =?utf-8?B?S3hjMGlHMVNSTm5DUVVRWTlydThEVW5tK2dmRTU3TXdxZjZ1L29KbkNSaWxT?=
 =?utf-8?B?OHVSMk9pVEdZQ3lnWjZnVFllczk4ZzVrR3dsdERLSTRsSEtCK3I2TE5aY1FO?=
 =?utf-8?B?Y1FyN0FETHFqQzZHYU5qRC9XSUttUDhDOHdnZlZvN1V5UUZYUHhRQW5ITkF6?=
 =?utf-8?B?SS9TMFZvZUFVK2lMckpmZzNSZ3JnaWExdE91V3JSOWNsZm8wdW1QeGJXUjl6?=
 =?utf-8?B?VDZKNituNndKVmt2RzNkOFo3ZXhOM2Y5empKTjdvMWRPbmlIVXp0QVBQR1lr?=
 =?utf-8?B?WmVTWmphbTNTWDJDQzJGTHpFQ2l2QjJxVytzeUNxSHdZc1h5ZFJjRzhKOGt3?=
 =?utf-8?B?NDJ0a0Z4QUI3cTJUeXZZM3FJUmZJOFZiOUgzbEVHN0xnczg5ZVJDREFaZ1Rq?=
 =?utf-8?B?L2JXOUpwM25mM05MT2Q4U21hNTArN2crRWhadHdHUWdPSysvM1RsRlVqWVBm?=
 =?utf-8?B?Q3FNTFdsT3pmdlRwSmUwRUNxRXNoTDVqeEdoSWRoTUN2eURQRnVzeS9jMi82?=
 =?utf-8?B?RitUM3hkRDN4dkpxUUEyUVlFVmh5KzJiWFozb1ErTjJuQkZla0hKYnFSYllO?=
 =?utf-8?B?blNsWVNlUmZiY1M2cTIrWjNWTXJvYWwySTBPUE9Lckd5aGVlNEpNaUQxQm54?=
 =?utf-8?B?YnNtdjMyQVVCUyt3bDZVSmtEOXBFNUF6M0F0SURsb3RNMTIyUHozSGJhMXVH?=
 =?utf-8?B?Mm5uNTI0Tll4NTZHL25IbVBhMFhOcnhaR1ZreE9yWVFJSUhLNGhqWEsyWjEx?=
 =?utf-8?B?WWhXUXMycmVNQUx0YlppQkVFVUZDVUxySmY0WWJSenRSRUJaaW95TXYyUXZv?=
 =?utf-8?B?QTJXSk0vUHl0RXhySzZyRVZZK0VFeVg1b1oveDhhL2hDS08xalZsTE1jTVlI?=
 =?utf-8?B?bk85WkxJQTBXcTlwZ0MwMDVqOHJ1Tm5odk1oWTluS3ZrMHlSUUt3ekNuZDl4?=
 =?utf-8?B?azcyVzNUSHhVMzQ3eUhuempJUDdWY0VFbHVVblhRdUVpUEZBN0xnNmRzeHBw?=
 =?utf-8?B?MCtlb01ZNTBxNTVjc0paTGZmQWRPTFE4Q2FzWDd5Q0p5N2ptQmpJUk9vUk8r?=
 =?utf-8?B?Y1hGSWlUUzlkbHZ2SjVZaUIva3ZqMkp0aE9KYnpKMllNa3NDREtGdytOQ0ZV?=
 =?utf-8?B?STcwbm1yczVwQitTOUt1TFA4UGZ3L3JVRXJjMzBoSjhadzNPRWRzZUtabnY3?=
 =?utf-8?B?VFFlMEtqa1Uzd1loRkdXSWpZVzlScG43TmxZYXpNSnExTXVIaCt0Mll1OTZa?=
 =?utf-8?B?SWJ5NmdXUXd6enJUVDZiTDEwa01xc3BpRWhIbmROMkloS1kwZVV5NXZxT3F5?=
 =?utf-8?B?eGt4Z2I0QXJVRkF0RG9UTTBQVzNqU3NEek83cXhZZmYrc25MSVZLZ0crY29o?=
 =?utf-8?B?bEVQVkowTE1oQzFhYmhNYmhzeTZ2ODNGcThOSzNyT1BPcHlKVXptdVFndk5Y?=
 =?utf-8?B?WXJYdHlDOXFwL2p0K1psQllyV2NFNlFKMDhpRDFCdCtNaUxUZXZESlkyZ1My?=
 =?utf-8?B?WXlkeXc4SVVzaTdLemlMMm9Wd2s3RjZTbEVwZFJLVXBPUUVrMmNDN2p0bjRq?=
 =?utf-8?B?eUZVSFdxVVVsTXlvYm9rSjBEdGZ2UHdkZVBiTnM0OGovc1V6MElyRnN3aXR2?=
 =?utf-8?Q?biEkiC0JFnc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0tPeWNjRzc0NnlkKzlpQjZYd3VzcDRZZi94RGpBNkY3WGpvTU1WRGREbFhR?=
 =?utf-8?B?UXEvZnFWdzZ1cnA1dE1WOElsTlU5SG9LOXpBeFVOakNPK1g3eUI0eFlpVzVv?=
 =?utf-8?B?Tm9BeGpPWjFzdWZHa282ZjJxNk5abVdVTExnQmRlK3FHKzl3RTBXRGY5Q0dV?=
 =?utf-8?B?c0VSeFdhS0pKNjBYekZKdnd1bTQ4WVU2WnFzZFJuS0I2aGNJT3FxZlFQeDdx?=
 =?utf-8?B?TFdrQ2tNenptMC9PM3VZREJ4WjU3bytrcWdIOE4veDNtQW5ySFdhWlJTbmNF?=
 =?utf-8?B?Q0N1MWVtYWFPQU5GRGZucW5sTFp4aVJuTVhXSU83cXV2VWpJaitMdXlJZzlV?=
 =?utf-8?B?RkxIY0VWTkgyeEhMZVlmTUJHdmFDVGN1R0RYNWdEeXpXaVJUanNBV3VKdWc4?=
 =?utf-8?B?dStHdUc2U2ZUWVVZblc1eUo4dS9relBDTUhFcEdDalhOTk0xWGFzdkZRMGhs?=
 =?utf-8?B?L1NndHFDSkZJVW5idWM1VzhlM2FEM3VyWnh6NTM1KzNjeVE1eDZ0UFcyMVZs?=
 =?utf-8?B?bzFaenNtNW1jZ3JiWmh5YjVKN1loMUtOdElpQzB2RzVjVUszemdWa2NvUW5S?=
 =?utf-8?B?OE9aQVVSakpRTVpqb09vUSs1TUcweGp2K3VUNFNMUUNoUnFlS0RuZXJ2Snhm?=
 =?utf-8?B?Y2FnVDFjWmJzSVFrbVhrblVHaVZIK3FPUDhPeG9RamNsTFViR1UvTmdHV09z?=
 =?utf-8?B?RFN4SnNvVTZ3MzFVY0wxVUdGVjM1eTM1eXdCZUM1bGZIMElETmVVUEc2UDJl?=
 =?utf-8?B?a0VaUU1nRCtnYmd3dXhabFlZdnVSUlVZSk9ud3daYnU1OTlCRGIzZk55WE5n?=
 =?utf-8?B?bnFBN21zNzdtWnE1QnFkcksxeUFUWEpPczFOMGY4QWt2WEVwWllVaWc4cHVJ?=
 =?utf-8?B?eTNMcUgxRWdtajkrNjBWcXM0YWwrcWw2VzRxcVFxNFAxNGtjZlprR1FXMHVh?=
 =?utf-8?B?aE53dkU2QU9yejd6dGtDaDd4NWNSZk9mRGY4azFDbGo5aTkzMlFwZEFJbU9a?=
 =?utf-8?B?RE81Y3VSZzZpdld1a3g1eHVVOURRSVBJY2Iwd3JjWm9ubVR3azArbXprTXdJ?=
 =?utf-8?B?dzlSVUU0dUlLYmd0RTkzbzFRcU1oL0RFMVVBcEVwWGRpMjFiUnM0emJyZDhH?=
 =?utf-8?B?Y2JBaHNENGF1N0hkYWlGa1oyZmh6NGNtcWdmV1pkQ2tBaDBmNzVaTHN3ck5V?=
 =?utf-8?B?Nkl6N1RyNVJKU05aeHZkMGplUklpQkRXT0F2MitOcnArZDdaVGgxNE9TeUVq?=
 =?utf-8?B?Vnc3b2hFNXFkaUR0b20yd3l1L1NQcy9ubGtnU0E3TndHTndaWVkxdjFqS0lp?=
 =?utf-8?B?Q2dzR1pVOXNXQkNUaDJTS1RrS2NIUU8zK0lJQ3RndzEvZGl6SjQ1RjRkZE9j?=
 =?utf-8?B?alNWbHFQS1JzY2hoRC9PSnhLbklJNFVJSEcxVjQ3dEhCN0tldHl6YjZUU3hB?=
 =?utf-8?B?a0NlbjVPbElTY3JUVmhuYXRGQ0lWL09KTHZ5bjRscFNncUppNmJiSFc4VEN5?=
 =?utf-8?B?bGFFaU9ydk90Zit2Zlg4OVVGTHowcTlRODAyWlJvVHlGZGpqbzBQa3VKTUpO?=
 =?utf-8?B?aXM2RGRCUFNFZTdZR040TjM4a3dxRzRuYnB6YzQ2R0hGVkY1ZDJFbHFGNThX?=
 =?utf-8?B?RHVGM0N1bmttUkkySHBWd00yR1E0TWRIUEFHNEtUOUU1K2hOcGhmQ0hBeUQv?=
 =?utf-8?B?WTBFcjBxZ3NWbzhVZHRQK1ljVjdCTm1TMUpLODdUM2ZXNHVHU2lVamhlZ1hu?=
 =?utf-8?B?aXFDKzlFWXZMdW5WSE5sNTJ0ODREazlLRDNLUFRJbkN4NlNMTCtUc2NHYitM?=
 =?utf-8?B?OWIyS0FoQmRvTTE1WlRxaVIxZzBTVjE5QURCS25mRTJKZEIxK0NvNEVwMElL?=
 =?utf-8?B?Y3VSQ0o0UkVVaGN3Y09JdHVaY2hOT3pYZXRSUWlsTjZBY3orUVpxUzc3NkR5?=
 =?utf-8?B?dWIyTFJMTEdpOEZBalBqTEFmeFlXMldWby9ua2FLTTFFMTJaeFVVSGNEWXp5?=
 =?utf-8?B?VVU1YjNQWXZnNVBDRUcxTDhOYlM0QWFlTlplQVRFbERZRnF3cnpSSW13aU1y?=
 =?utf-8?B?dlp0UGZPM0NxaDFkRG1VUmdWcVhYZnYrZVFsRFN1Zk11OWR0Wkc1K2MvMFJX?=
 =?utf-8?Q?vEhJdCdbyFH2z2nDT86fsRvbk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 558856cb-fcc5-4290-c47c-08dd71784ed3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 23:52:49.0931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWAUUKwAg44avwcqropfvxrYQOYq4NBCgc0ogJjQ8Uhtmpu6A5NuSFlUM3UIQHhJNe7sNc7OSbEcaB1ewmLX5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8446
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


On 2025-04-01 12:06, Kamil Konieczny wrote:
> Hi Sunil,
> On 2025-03-28 at 13:54:10 +0530, Sunil Khatri wrote:
>> Sync with drm-next commit ("866fc4f7e772c4a397f9459754ed1b1872b3a3c6")
>>
> Hi Kamil,
>
> I removed this line
>

Sync with drm-next commit ("866fc4f7e772c4a397f9459754ed1b1872b3a3c6")

> as I believe it's internal information. If there are no objections, I'd like to merge without it.
>
> I just saw your reply, but I'll wait until tomorrow.
>
Thanks, Vitaly
> I could not find this commit in drm-next nor drm-tip,
> please add also subject to hash, like
>
> Align with kernel commit cd5bbb2532f2 ("drm/xe/uapi: Add a device query to
> get EU stall sampling information").
>
> One more point, you could also consider adding all in one patch
> unless they come from different trees, then please indicate from which
> ones they come.
>
> Regards,
> Kamil
>> Adds a new subquery (AMDGPU_INFO_UQ_FW_AREAS) in
>> AMDGPU_INFO_IOCTL to get the size and alignment of shadow
>> and csa objects from the FW setup. This information is
>> required for the userqueue consumers.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>  include/drm-uapi/amdgpu_drm.h | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
>> index fed39c9b4..8108c0c8a 100644
>> --- a/include/drm-uapi/amdgpu_drm.h
>> +++ b/include/drm-uapi/amdgpu_drm.h
>> @@ -1439,6 +1439,27 @@ struct drm_amdgpu_info_hw_ip {
>>  	__u32  ip_discovery_version;
>>  };
>>  
>> +/* GFX metadata BO sizes and alignment info (in bytes) */
>> +struct drm_amdgpu_info_uq_fw_areas_gfx {
>> +	/* shadow area size */
>> +	__u32 shadow_size;
>> +	/* shadow area base virtual mem alignment */
>> +	__u32 shadow_alignment;
>> +	/* context save area size */
>> +	__u32 csa_size;
>> +	/* context save area base virtual mem alignment */
>> +	__u32 csa_alignment;
>> +};
>> +
>> +/* IP specific metadata related information used in the
>> + * subquery AMDGPU_INFO_UQ_FW_AREAS
>> + */
>> +struct drm_amdgpu_info_uq_fw_areas {
>> +	union {
>> +		struct drm_amdgpu_info_uq_fw_areas_gfx gfx;
>> +	};
>> +};
>> +
>>  struct drm_amdgpu_info_num_handles {
>>  	/** Max handles as supported by firmware for UVD */
>>  	__u32  uvd_max_handles;
>> -- 
>> 2.43.0
>>
