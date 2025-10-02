Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BDFCAC5B8
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 21:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0960310E845;
	Thu,  2 Oct 2025 21:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mtDhsTn3";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010023.outbound.protection.outlook.com [52.101.85.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989FB10E845
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 21:29:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ob//Zy/xBXnd8f3XL5jcSDgpG9u2R0sBcDoKwhoPSh1fo/XyeK9wwkjYBJpUOxxvZqAQ/yhTXrIAxo7dTvXAkUgJoDe7LMqrfKJetl3qbBQh+AN+JjG94WELOxJG87E3sFvZc6DIstZFmLDUpVRVii0xNPOSnv1qNxd8/G/Dq5nJGCO/+I81rzmXb6iPQPu1t+uFUgQu5eNRHoWgYpcnmSXzimYmjol0UiEBbogTwnlLHWvblB+H9ZMPjz2kL1jZvH3Xd2OfNwjnBNGuktQOlAdnCA5jcZlkumFFTY/P0GTsiHumnBNfOEtDu3wb4LggUgED6ehQruDBXzQ61xTVOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiqaUjjHkE2X1MSjWzKSuybgFVkjml+t62rOfUQ8Ces=;
 b=RfB7K0Y1xQneDpThRBBk1r+CC/cBQUU+3i9GlDEC9xCDSWhAMs2SSEZmPY8bIcnkER/Fv8Em5Di+BagPeMvtOFGj4YPr53fWWgk0gtAVawWB+KbQRRJx8iyKiplPOPGKJp/7IDn9oMwFtSpNWfzoCPkcRf8uwbQzIRDoph0DCSavc/CfzNHSH/SU2qu/MWF/nYznkMurzf+xFaEXKmwdGsTU228KKASAGw83Rf2LFGLTtWjAd5QvnzVgUyWK2R2wyfs5/H4n0h3ylcgVKWdluIJrZtB/OSIWvk9BZuBI48Ksyi4ZvRvmPxN2jGoqbgIM2eoVMqQlwTj5SSt1IbNL/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiqaUjjHkE2X1MSjWzKSuybgFVkjml+t62rOfUQ8Ces=;
 b=mtDhsTn3QkYQCXxaYl0KKwZsaOh050JSrONYk8f5GlHw1ZKijcGuPZ4nOLGhN0U+uyzN5VXOJrnKQ5fR28rBCVz8jQZXaKoJRQBpj1ZtGfkLNnUB99c69mR6ufvrZj6xKxBQj1vB7/PvQx6R/Ib2xZU2LPRakJskJ52pPThVLhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA0PR12MB8206.namprd12.prod.outlook.com (2603:10b6:208:403::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 21:29:55 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 21:29:54 +0000
Message-ID: <7d48c6fe-7f05-4565-8882-a0dcda44ac51@amd.com>
Date: Thu, 2 Oct 2025 15:29:53 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 03/30] drm-uapi: Add COLOROP object
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-4-alex.hung@amd.com>
 <43b1953e-44a6-4964-8fd5-02743f55587a@bootlin.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <43b1953e-44a6-4964-8fd5-02743f55587a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0127.namprd04.prod.outlook.com
 (2603:10b6:303:84::12) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA0PR12MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: ef0b7e82-fe35-4708-4a89-08de01fad42f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFlzTXhuWjN4MW84dExYZjBuK3RIbVNEcEVNeStVZUlyYmNxS3VhTjZiR0RB?=
 =?utf-8?B?ZCtyYTNtNmdMdEhCVUFmZDlLMkpRVDA3Q2ZjQmRPd1pqRnlheDRhZ0J3K1Zk?=
 =?utf-8?B?WjJUcjVuVVZTakVQVHoycThscndZLzYrLzc5VWdCWEVHWmtSOVh6cW1SWmo2?=
 =?utf-8?B?VW80RVA5YXBqRGpNMkNyVFgzRmtBWDdjOXlXMk1sN2d6V2pUZ3hXMkNLbkQ0?=
 =?utf-8?B?WURLRGpUanB4cnhGOWtLVFdCcmNrWHRVbHcvQXIxNkxxUksrcEVnMFQ1TWsx?=
 =?utf-8?B?REdJWk5mMjJwcEY1OXFLRzRHTTZkUVVhanZ0ZWFmeElrTXZQVGZVRUZrNkx4?=
 =?utf-8?B?OUU0TVBQNTZoVHk1N2crYXNZeTRseGlyMmFUR1RydnBRSXhuMkRlZXROMFpL?=
 =?utf-8?B?c3cxQXdpZ0NRK1hRaWJWQkpreGJrU1AwUEpkVkJwQitzRXFMMEhsWTNQV2po?=
 =?utf-8?B?WkFMSDhuS3dwNmFvQ050cEJBMlZIYjE0dXlKbjhFWno3THJsYzdIMnhFc1p3?=
 =?utf-8?B?NFlDM0ZPWHZ6bk41RGl0eHhLZWRGdDJMaHg5aEh0NmtxQitJN1Q5eUJ3Sm9r?=
 =?utf-8?B?ZG5nbWRnM081ZUdOd3ZWSUZFNGpSTUR3VGFQS3dQOWF0V2Rqd0JKa0RNV1Vx?=
 =?utf-8?B?Z2ZLRGsrRGhBYStjWmVuS2ZEK0tycmkzWDROSWdWWk8xYnYrUk91YkVkVXRk?=
 =?utf-8?B?QVlJK243VTl2Z3ZPUkEyV2p6OHRsTTdqVFFZMDhRc05BQTRjNTl5dndaRjVQ?=
 =?utf-8?B?TW44c2tmSC9Na2NRUC9wcERWc0tXUlQvTXN2ZTBraExUNjNjL1Z1ZU1zKzBF?=
 =?utf-8?B?SFdtQ1E4aUxlQTVCaEVMM1lDK3oyL3VTQ21uU0d5dXYyQklZaURSeXRENkF5?=
 =?utf-8?B?dk4wRkdmQkJwbks1NkZIcVhLbUxPSTR4UVpTdHMzR3R4Z0I3QUNhRU4rWHlW?=
 =?utf-8?B?QjA5eTJTczNnenNTVmtCNDBQVm9WUnlIRnlBcUpick51a1BRVVBUMzh6WXhR?=
 =?utf-8?B?ZlBmYkRMOGRRREFMVTk3SDVEZ2s3M3lqaVpIYitUZXBXZ2lrZnduek1CRTFP?=
 =?utf-8?B?Tm42WGhGQTFqMTU1ZDkxOEFMczRZaTlqT0FwOTVzbkVyK3NWTm0zQnVpS0s3?=
 =?utf-8?B?bCtYbWtEWFM5L3BjM3Fhd2ZGSjVoS1BESnR6KzhFUEUwTDF2bzRrYUtXc3Qy?=
 =?utf-8?B?WXVBMVhHZUgrOXZ6NE1rdDRQSkg5cFhxdS95bHpoZlVrbUxkTzRJTkZUR2F1?=
 =?utf-8?B?dmR5cnhFcEdsVzRZNzBrQnZjdzVPc1U5NEhhOUJuTHlLS1NKV2hneDE3VTF1?=
 =?utf-8?B?dVZZcU5aekRPdkovem1IL3NFN015Mml4aG1weGczWVVvZmI2eThIWUlWbS9C?=
 =?utf-8?B?Sm1FQmQ1a2hiRVFtbjdINVJZOHd4ZmhYbXB4M3BxWUlDWTZHaFRpcnR5SXpG?=
 =?utf-8?B?Zk5tb21KZ0dXdEs0TGRvYzNZZ2prL0RnMjRCRWg0SG9zTG9WTE9PanVjakRM?=
 =?utf-8?B?ZWNxQlEyRWJ2Vkwzem80VUsyVXc0dXpoZTErWU9sM2dPZnlOSExmR0QzTnJQ?=
 =?utf-8?B?ZmxmWEVmUG5jM2JZeG9OV3NYeTh2b2NSeXR2WnVDeUk4Tm9MTkExN096MTZp?=
 =?utf-8?B?QnBGRUxpRnZBTEZONEZ0VG91NHNoWXd1ekJCWHE3L0hDTld2MWJUMkpkeEV0?=
 =?utf-8?B?eHJvZ1hMT2ZEZU9qS09GSW56VjlVQkV4SzgrQms2U0NwMm5tM1ZralZ0V2Jn?=
 =?utf-8?B?cjlUcDFvcURKTGlqVmVVSEt2T2xRMTlIQStxN3FjQ2pZRHRsdG4vVUJVTTFQ?=
 =?utf-8?B?UHduY1hoQzNRK2l2L05ldTZRakk5OUZuTjFaamZKRWozWE9Vd05sTHZ2cUNE?=
 =?utf-8?B?SEV4OHhnMitSTXAwZHlraVJaMTQ3NmNHdmI4Q28rOEd5U3dPd0Y1SWsyVjZ4?=
 =?utf-8?Q?haE+s30ZdJrsXccJXJbbZirdHMiI8omd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGdrOVpzeHRDTWJ1dWJsQUo3aGdiVGZRYTlqZDM4YmxGL1hNTEpRbHd6UFlK?=
 =?utf-8?B?WHFsQ2VrdkEyM1UxbGJxT21QVDQwbG1VM2pvcUtSeTl0dm5ETFJjNWs1aWIy?=
 =?utf-8?B?a2tRYnFFRXMzNFlSbW4zWmUyS2xIcUovU3ptK1Zoc1Izd3ZWNjEyeEc0dVFB?=
 =?utf-8?B?R2pyYmp3c2ZYb29xVmw2aDFPU2pEYmJ6VG5idnBHdEpsejFqbkxHRUJ3TTBr?=
 =?utf-8?B?bEZldHdYS2haQjN6SGJXbkdmWk1HeU5yVGhzckFGWEk2Sk5KbjFzZjNQU2wz?=
 =?utf-8?B?Uk1xcjF5QzhCeXVYbUIwWERpL2tyQ2ZmZGZaaGNXRW9OaVBLc1gvUGNocUlL?=
 =?utf-8?B?Mk9FMmRXTjluUEk5TElKekRETlRZNHB2UnFZWmhSODc2UWtYSzdudGozZlor?=
 =?utf-8?B?WUhxQy9BMjl5cEZINUNHaFNkNzNHaTB2VDVRc3FRNFNGblptQWlFRDl5WlVF?=
 =?utf-8?B?bG43bkNPRk9ZbzU3cm1PTk1tKytxdHQyNERWZHJqSFltQXRRNHluV1BDRENx?=
 =?utf-8?B?b2xuQzRqdjgxTFNoODJXWks3ZEhkTi9VZjhmblhod0xQSDNSSkh5Wm92NzVa?=
 =?utf-8?B?dkF0bFRJTGwyWStjOEhqR0ZkOTRRKzFQRlB3TjIzK3NydElmdVBhS3F6QjBH?=
 =?utf-8?B?ak52VEFGdks1MVhSSkRpYzA1MDE2Uk4xajRldUtTWDE4ckh1VEF2WkI2Y3BH?=
 =?utf-8?B?dW1kcmRTV2RPQUtubk5ZaHAvb3hjU3ZGMk9aY2lXM2JzWDhDa25Lakt4OGhn?=
 =?utf-8?B?M2lJTUtTQmZZS1h5bFBON1VhdUJ1Y1N0M3NEQ0FTZzE5b08vTzk0cGtmaXEv?=
 =?utf-8?B?akZMck0wRlhNS0dJT3g1Ty9QWCtISmpiYTdnMmpJQTQvZHhHYUNrZG1ocTZ5?=
 =?utf-8?B?aXdBcDZRMCttbG5LUkJobUtsRUFaRDEwanZrM29DbEJLeDBFUUt5TnpNZ3l6?=
 =?utf-8?B?R2FBYlp5WWk4Vlg2dzVQU2NxbElaWDE3RW9HUXpRdm9reTZtUUFvWlp6MkQ3?=
 =?utf-8?B?R0VVcUhIZHBtYlFsbGFZRnN0WVRRd3N2VnVXYi8yT1k4d2lzNlNOZ2xyTXAy?=
 =?utf-8?B?bm9zY1ByUlltWHU3cjJndzZFYWpxdkxBSEtGa01GS3hMWXprc3UvK2NmWDJE?=
 =?utf-8?B?OE9CTU1UU3NEYlVFa25GN2hqMWhuaGE0S0FnbGlHaFlEOGIyOEZRZHlvd3Nx?=
 =?utf-8?B?U1hVK2xsZ2dzN0YwN0d2cWpGY0JLNW0rR1pIenFZc0g2eUVMZnYyUTk2ZGVx?=
 =?utf-8?B?dmk2K1ZtMDV5MGFrUkMrakFuYTZWaS82dGM4dmtHOFJBK1ZSNEF3MmduVXYz?=
 =?utf-8?B?RmVqb3pUMm4xN0orN1FxWEFyQnd0ZTFNOWtETFdNRnZ1dmJzRStJYjhSMUha?=
 =?utf-8?B?TXhPRUc0MHZ6dDdOZ3V0TktVbnNmNEtZcUFweTZ3R1Q5b1Q0Q0pXbUkybk1R?=
 =?utf-8?B?TUZqbEE0QXNWMlkyUSsxTngwRnZSZ1ptazVDZWhpeG1qb1ltSkRxMWJpdmxV?=
 =?utf-8?B?MVdPTHR2MGlFcy9DWDY4d2JlM3kxLytCczAzSElXS2E5ODlTRlBGM09nb2RW?=
 =?utf-8?B?U0hHa3h4QlRNdWExWU03YnFWbkZJUUJuUHJWbm1HYndyWFFFVnE5enQvSzYz?=
 =?utf-8?B?U2QzNWlMcGlIREExVmFRWFg3SGEyMFJQbkROaCs0eUs5T3Q2N3BFRE9hVmxH?=
 =?utf-8?B?d2tva3FScUJHangrbVIrdUVkNldFNlVMc3JnbGFGOFdJenNqbXRTUE13aEMx?=
 =?utf-8?B?Qnd4R0dJdzk4MmlCRzhRQlJZb1pCOTdybnl4Z0NGZnVkOHFUTWFZK2w1ZlRE?=
 =?utf-8?B?WUdVSkFrWU5rWGVERTR5WU8zOEZwT1dLRURUR2JBQXg5dVVhd1VjQUMyeENF?=
 =?utf-8?B?Q0JwSTBxUU1VZHNIUVo0WW9IRWtMWTFLbllsWmtVVUhsNXBOT3ExS2R2NWJl?=
 =?utf-8?B?T3duV2ZXUHZHK2Y0QTlOamI2ZzN6VFlhQ0Y4dFE3SlhCNFpqMDJNUWZuNzd4?=
 =?utf-8?B?NlRrbzBTV1htWE5qRHFaeko0NkJYVDlmZnAvdndPSG5CTlBUaVRFZHpHS1p2?=
 =?utf-8?B?RFFQenBnZk44RW1kOWkycE8rY3JiUkw2U3kreDR5WEp0T05WVktEVTF2Sld2?=
 =?utf-8?Q?UG8aAg6KUzy1r6Dyr8K70jZ1C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0b7e82-fe35-4708-4a89-08de01fad42f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 21:29:54.8187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HvqQq8SWB7ekgkgnMPP0L42U2GuFjDCTSEsJRg6gzAGm+k9txSHwJzwo0HVYvubG+Qa+MiRCBcqFWPkSI9tapg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8206
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



On 9/30/25 04:37, Louis Chauvet wrote:
> 
> 
> Le 15/08/2025 à 06:06, Alex Hung a écrit :
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> DRM is introducing a new DRM core obejct, a drm_colorop. This
>> object will represent one color operation in a color pipeline.
>>
>> Introduce the object type in the drm-uapi, including the
>> following types:
>> - DRM_COLOROP_1D_CURVE,
>> - DRM_COLOROP_1D_LUT,
>> - DRM_COLOROP_CTM_3X4,
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>   include/drm-uapi/amdgpu_drm.h |   9 --
>>   include/drm-uapi/drm_mode.h   |  23 +++
> 
> Same as 01/30, I think this could be a separate patch "update headers".
> I don't know what maintainers want, but I think all the update could be 
> done in only one commit "update drm uapi headers to match color_op patches"

Let me see if I can put all changes to drm-uapi to one patch.

> 
>>   lib/igt_kms.c                 | 272 +++++++++++++++++++++++++++++++++-
>>   lib/igt_kms.h                 |  89 +++++++++++
>>   tests/kms_properties.c        |   3 +
>>   5 files changed, 381 insertions(+), 15 deletions(-)
>>
>> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/ 
>> amdgpu_drm.h
>> index b38f27d69..ca24519c7 100644
>> --- a/include/drm-uapi/amdgpu_drm.h
>> +++ b/include/drm-uapi/amdgpu_drm.h
>> @@ -1590,15 +1590,6 @@ struct drm_amdgpu_info_uq_metadata {
>>   #define AMDGPU_FAMILY_GC_11_5_0            150 /* GC 11.5.0 */
>>   #define AMDGPU_FAMILY_GC_12_0_0            152 /* GC 12.0.0 */
>> -/* FIXME wrong namespace! */
>> -struct drm_color_ctm_3x4 {
>> -    /*
>> -     * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
>> -     * (not two's complement!) format.
>> -     */
>> -    __u64 matrix[12];
>> -};
>> -
>>   #if defined(__cplusplus)
>>   }
>>   #endif
>> diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
>> index c082810c0..fce45b5cf 100644
>> --- a/include/drm-uapi/drm_mode.h
>> +++ b/include/drm-uapi/drm_mode.h
>> @@ -629,6 +629,7 @@ struct drm_mode_connector_set_property {
>>   #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
>>   #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
>>   #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
>> +#define DRM_MODE_OBJECT_COLOROP 0xfafafafa
>>   #define DRM_MODE_OBJECT_ANY 0
>>   struct drm_mode_obj_get_properties {
>> @@ -846,6 +847,22 @@ struct drm_color_ctm {
>>       __u64 matrix[9];
>>   };
>> +struct drm_color_ctm_3x4 {
>> +    /*
>> +     * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
>> +     * (not two's complement!) format.
>> +     *
>> +     * TODO what's the format?
>> +     *
>> +     * out   matrix          in
>> +     * |R|   |0  1  2  3 |   | R |
>> +     * |G| = |4  5  6  7 | x | G |
>> +     * |B|   |8  9  10 12|   | B |
>> +     *                       |1.0|
>> +     */
>> +    __u64 matrix[12];
>> +};
>> +
>>   struct drm_color_lut {
>>       /*
>>        * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 
>> 0.0 and
>> @@ -857,6 +874,12 @@ struct drm_color_lut {
>>       __u16 reserved;
>>   };
>> +enum drm_colorop_type {
>> +    DRM_COLOROP_1D_CURVE,
>> +    DRM_COLOROP_1D_LUT,
>> +    DRM_COLOROP_CTM_3X4,
>> +};
>> +
>>   /**
>>    * struct drm_plane_size_hint - Plane size hints
>>    * @width: The width of the plane in pixel
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index a9641eba4..69beb523f 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -92,6 +92,7 @@
>>   #define MAX_CONNECTORS 32
>>   #define MAX_EDID 2
>>   #define DISPLAY_TILE_BLOCK 0x12
>> +#define MAX_NUM_COLOROPS 128
>>   typedef bool (*igt_connector_attr_set)(int dir, const char *attr, 
>> const char *value);
>> @@ -702,6 +703,14 @@ const char * const 
>> igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
>>       [IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
>>       [IGT_PLANE_SIZE_HINTS] = "SIZE_HINTS",
>>       [IGT_PLANE_IN_FORMATS_ASYNC] = "IN_FORMATS_ASYNC",
>> +    [IGT_PLANE_COLOR_PIPELINE] = "COLOR_PIPELINE",
>> +};
>> +
>> +const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
>> +    [IGT_COLOROP_TYPE] = "TYPE",
>> +    [IGT_COLOROP_BYPASS] = "BYPASS",
>> +    [IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
>> +    [IGT_COLOROP_NEXT] = "NEXT",
>>   };
>>   const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
>> @@ -769,6 +778,108 @@ igt_plane_rotations(igt_display_t *display, 
>> igt_plane_t *plane,
>>       return rotations;
>>   }
>> +/**
>> + * igt_find_colorop:
>> + * @display: display on which to look for colorop.
>> + * @id: DRM object id of the colorop.
>> + *
>> + * Returns: An igt_colorop_t if found, or NULL otherwise.
>> + */
>> +igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id)
>> +{
>> +    int i;
>> +
>> +    /* find corresponding igt_colorop */
>> +    for (i = 0; i < display->n_colorops; ++i) {
>> +        igt_colorop_t *colorop = &display->colorops[i];
>> +
>> +        if (colorop->id == id)
>> +            return colorop;
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>> +/*
>> + * Retrieve all the properies specified in props_name and store them 
>> into
>> + * colorop->props.
>> + */
>> +static void
>> +igt_fill_colorop_props(igt_display_t *display, igt_colorop_t *colorop,
>> +               int num_props, const char * const prop_names[])
>> +{
>> +    drmModeObjectPropertiesPtr props;
>> +    int i, j, fd;
>> +
>> +    fd = display->drm_fd;
>> +
>> +    props = drmModeObjectGetProperties(fd, colorop->id, 
>> DRM_MODE_OBJECT_COLOROP);
>> +    igt_assert(props);
>> +
>> +    for (i = 0; i < props->count_props; i++) {
>> +        drmModePropertyPtr prop =
>> +            drmModeGetProperty(fd, props->props[i]);
>> +
>> +        for (j = 0; j < num_props; j++) {
>> +            if (strcmp(prop->name, prop_names[j]) != 0)
>> +                continue;
>> +
>> +            colorop->props[j] = props->props[i];
>> +            break;
>> +        }
>> +
>> +        drmModeFreeProperty(prop);
>> +    }
>> +    drmModeFreeObjectProperties(props);
>> +}
>> +
>> +static void igt_fill_colorop(igt_display_t *display, igt_plane_t *plane,
>> +                 igt_colorop_t *colorop, uint32_t id,
>> +                 char *name)
>> +{
>> +    colorop->id = id;
>> +    colorop->plane = plane;
>> +
>> +    if (name)
>> +        memcpy(colorop->name, name, sizeof(colorop->name));
> 
> Maybe use strncpy to avoid issue if name is smaller than colorop->name.

How about "snprintf(colorop->name, sizeof(colorop->name), "%s", name);"?

> 
>> +    igt_fill_colorop_props(display, colorop, IGT_NUM_COLOROP_PROPS, 
>> igt_colorop_prop_names);
>> +}
>> +
>> +static void
>> +igt_fill_plane_color_pipelines(igt_display_t *display, igt_plane_t 
>> *plane,
>> +                   drmModePropertyPtr prop)
>> +{
>> +    int i;
>> +    uint32_t colorop_id;
>> +
>> +    plane->num_color_pipelines = 0;
>> +
>> +    for (i = 0; i < prop->count_enums; i++) {
>> +        if (prop->enums[i].value) {
>> +            igt_colorop_t *colorop = &display->colorops[display- 
>> >n_colorops++];
>> +
>> +            igt_assert(display->n_colorops < MAX_NUM_COLOROPS);
>> +
>> +            igt_fill_colorop(display, plane, colorop, prop- 
>> >enums[i].value, prop->enums[i].name);
>> +            plane->color_pipelines[plane->num_color_pipelines++] = 
>> colorop;
>> +
>> +            /* get all NEXT colorops */
>> +            colorop_id = igt_colorop_get_prop(display, colorop,
>> +                            IGT_COLOROP_NEXT);
>> +            while (colorop_id) {
>> +                colorop = &display->colorops[display->n_colorops++];
> 
> I think you also need to check the n_colorops value:

Thanks for pointing out.

> 
>      igt_assert(display->n_colorops < MAX_NUM_COLOROPS);
> 
>> +                igt_fill_colorop(display, plane, colorop, colorop_id, 
>> NULL);
>> +                colorop_id = igt_colorop_get_prop(display, colorop,
>> +                                IGT_COLOROP_NEXT);
>> +            }
>> +        }
>> +    }
>> +
>> +    igt_assert(plane->num_color_pipelines < 
>> IGT_NUM_PLANE_COLOR_PIPELINES);
>> +
>> +}
>> +
> 
> [...]
> 
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index 8ec39fa85..dc2a2d9e0 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -366,9 +366,18 @@ enum igt_atomic_plane_properties {
>>          IGT_PLANE_HOTSPOT_Y,
>>          IGT_PLANE_SIZE_HINTS,
>>          IGT_PLANE_IN_FORMATS_ASYNC,
>> +       IGT_PLANE_COLOR_PIPELINE,
>>          IGT_NUM_PLANE_PROPS,
>>   };
>> +enum igt_atomic_colorop_properties {
>> +    IGT_COLOROP_TYPE,
>> +    IGT_COLOROP_BYPASS,
>> +    IGT_COLOROP_CURVE_1D_TYPE,
>> +    IGT_COLOROP_NEXT,
>> +    IGT_NUM_COLOROP_PROPS
>> +};
>> +
>>   /**
>>    * igt_plane_prop_names
>>    *
>> @@ -377,10 +386,20 @@ enum igt_atomic_plane_properties {
>>    */
>>   extern const char * const igt_plane_prop_names[];
>> +/**
>> + * igt_colorop_prop_names
>> + *
>> + * igt_colorop_prop_names contains a list of colorop property names,
>> + * as indexed by the igt_atomic_colorop_properties enum.
>> + */
>> +extern const char * const igt_colorop_prop_names[];
>> +
>>   typedef struct igt_display igt_display_t;
>>   typedef struct igt_pipe igt_pipe_t;
>>   typedef uint32_t igt_fixed_t;            /* 16.16 fixed point */
>> +#define IGT_NUM_PLANE_COLOR_PIPELINES 4
>> +
>>   typedef enum {
>>       /* this maps to the kernel API */
>>       IGT_ROTATION_0   = 1 << 0,
>> @@ -406,6 +425,20 @@ static inline bool 
>> igt_rotation_90_or_270(igt_rotation_t rotation)
>>       return rotation & (IGT_ROTATION_90 | IGT_ROTATION_270);
>>   }
>> +typedef struct igt_plane igt_plane_t;
>> +
>> +typedef struct igt_colorop {
>> +    uint32_t id;
>> +    igt_plane_t *plane;
>> +
>> +    char name[DRM_PROP_NAME_LEN];
>> +
>> +    uint64_t changed;
>> +    uint32_t props[IGT_NUM_COLOROP_PROPS];
>> +    uint64_t values[IGT_NUM_COLOROP_PROPS];
>> +
>> +} igt_colorop_t;
>> +
>>   typedef struct igt_plane {
>>       /*< private >*/
>>       igt_pipe_t *pipe;
>> @@ -443,6 +476,11 @@ typedef struct igt_plane {
>>       uint64_t *async_modifiers;
>>       uint32_t *async_formats;
>>       int async_format_mod_count;
>> +
>> +    igt_colorop_t *color_pipelines[IGT_NUM_PLANE_COLOR_PIPELINES];
>> +    int num_color_pipelines;
>> +
>> +    igt_colorop_t *assigned_color_pipeline;
>>   } igt_plane_t;
>>   /*
>> @@ -501,9 +539,11 @@ struct igt_display {
>>       int log_shift;
>>       int n_pipes;
>>       int n_planes;
>> +    int n_colorops;
>>       int n_outputs;
>>       igt_output_t *outputs;
>>       igt_plane_t *planes;
>> +    igt_colorop_t *colorops;
>>       igt_pipe_t *pipes;
>>       bool has_cursor_plane;
>>       bool is_atomic;
>> @@ -846,6 +886,53 @@ extern void igt_plane_set_prop_enum(igt_plane_t 
>> *plane,
>>                       enum igt_atomic_plane_properties prop,
>>                       const char *val);
>> +
>> +
>> +extern bool igt_plane_is_valid_colorop(igt_plane_t *plane, 
>> igt_colorop_t *colorop);
>> +
>> +extern void igt_plane_set_color_pipeline(igt_plane_t *plane, 
>> igt_colorop_t *colorop);
>>
> 
> (maybe a dumb question) why those fonctions are extern?

It is to match the coding styles with above function delcarations, and 
it's probably can be removed.

How about leaving it as it is now? Or does it is preferred to have it 
removed?

> 
>> +/**
>> + * igt_colorop_has_prop:
>> + * @colorop: colorop to check.
>> + * @prop: Property to check.
>> + *
>> + * Check whether colorop supports a given property.
>> + *
>> + * Returns: True if the property is supported, otherwise false.
>> + */
>> +static inline bool
>> +igt_colorop_has_prop(igt_colorop_t *colorop, enum 
>> igt_atomic_colorop_properties prop)
>> +{
>> +    return colorop->props[prop];
>> +}
>> +
>> +uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t 
>> *colorop, enum igt_atomic_colorop_properties prop);
>> +
>> +#define igt_colorop_is_prop_changed(colorop, prop) \
>> +    (!!((colorop)->changed & (1 << (prop))))
>> +
>> +#define igt_colorop_set_prop_changed(colorop, prop) \
>> +    ((colorop)->changed |= 1 << (prop))
>> +
>> +#define igt_colorop_clear_prop_changed(colorop, prop) \
>> +    ((colorop)->changed &= ~(1 << (prop)))
>> +
>> +#define igt_colorop_set_prop_value(colorop, prop, value) \
>> +    do { \
>> +        colorop->values[prop] = value; \
>> +        igt_colorop_set_prop_changed(colorop, prop); \
>> +    } while (0)
>> +
>> +
>> +extern bool igt_colorop_try_prop_enum(igt_colorop_t *colorop,
>> +                      enum igt_atomic_colorop_properties prop,
>> +                      const char *val);
>> +
>> +extern void igt_colorop_set_prop_enum(igt_colorop_t *colorop,
>> +                      enum igt_atomic_colorop_properties prop,
>> +                      const char *val);
>> +
>>   extern void igt_plane_replace_prop_blob(igt_plane_t *plane,
>>                       enum igt_atomic_plane_properties prop,
>>                       const void *ptr, size_t length);
>> @@ -1289,4 +1376,6 @@ int igt_backlight_write(int value, const char 
>> *fname, igt_backlight_context_t *c
>>   drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t 
>> *output);
>> +igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
>> +
>>   #endif /* __IGT_KMS_H__ */
>> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
>> index e646b8184..3bdf23aad 100644
>> --- a/tests/kms_properties.c
>> +++ b/tests/kms_properties.c
>> @@ -112,6 +112,9 @@ static bool ignore_property(uint32_t obj_type, 
>> uint32_t prop_flags,
>>               return true;
>>           break;
>>       case DRM_MODE_OBJECT_PLANE:
>> +        if (!has_color_pipeline && !strcmp(name, "COLOR_PIPELINE"))
>> +            return true;
>> +
>>           if (has_color_pipeline && !strcmp(name, "COLOR_RANGE"))
>>               return true;
> 

