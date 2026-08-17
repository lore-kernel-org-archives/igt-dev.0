Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DB4C5B572
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 15:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCE910E883;
	Mon, 17 Aug 2026 15:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="12/Blz4K";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010014.outbound.protection.outlook.com [52.101.201.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FEC10E878
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 15:39:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OujLLaYWXkBIYHhMccsit/L4VO15YtzWN8hlmFZq6SAiJKE5+XjRMcQ+sOi1mDXuOTY4DxmYFaYo/+5teQt++A/dfrngfAE5+xnqZr0ovUZpbRqqCu/4HmWULCM7aHBGxpms7sbjMJdZtFABBPMZD4S0aXR2yKAZl1tjhfged4GU6qbCRkxxkMlcuBzMjgGw57V5Ito+nIflOlMFhMG/DdFzp3Mb0IMBFzLUz/g539ol3uNXkLh+57g+8PK8UIRXgC8hByWJtCM6FlVrI0OkE+8okKeXr4WodiswCaUi4nLZ/ZXIbXWLPqjYq8keb0eZEFfqgisrPpsh0uWpW1GqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXiGEml9CP4ZU4zjptXh847BxILfte8ffqmAplud7dc=;
 b=IUu3atkYfc8IBOGldqlew3KPvQRTt7R6z2GgZd0HZNwos1Jy2YHRFssmjSxvPhXU5pUS6IxQXfRiwcm7K7b7Pm89/xv5G8zyWiePZ1npaT1YyYGmZfBiYHCgPsOl/zka5IitII1or7uyekuh9Qx1BYwh5VjlyE/XkGfivH+RLk1mcJOVmNDcV72jyOiV1X4bOLE+br99lDApWFfPDGfx38RcnW/TyzNvcNnvH4I+ZntAH7yf1bFMzSXCbsUk7EWYQGili/zH1qRiMsq9ITnUdt460KVNWQU4pO8woLv4tdKBvxxRADeH3fVwvgAUcW0nRFV3aCiYEtGlfK14w1Xu3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXiGEml9CP4ZU4zjptXh847BxILfte8ffqmAplud7dc=;
 b=12/Blz4KqwBBRmbutFg18NhIQYG3VYeWQWudwqEHxtRqqn46fQCmxnwDX0h/E0SdLzswY1ZqV25GDj6Sji/bAOA4h0nt8MNzFDiEE9lMvXsN/tZfSd70y9VtxFE+1wX++1Odgn3mrqWsRvDTo6izafduCKgOK8cc0zycfiOyMXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8)
 by IA0PPF89A593F05.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bd8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 15:39:14 +0000
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a]) by SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a%5]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 15:39:14 +0000
Message-ID: <9e390216-298b-45c5-9ca7-f8b65ae957da@amd.com>
Date: Mon, 17 Aug 2026 11:39:09 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 6/6] tests/kms_color_pipeline: skip if not an
 intel device
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Uma Shankar <uma.shankar@intel.com>
References: <20260811143558.141813-1-mwen@igalia.com>
 <20260811143558.141813-7-mwen@igalia.com>
 <62e1b4a3-ba46-4117-a3e3-05f9866aa614@amd.com>
 <83fb4a66-cf7a-4ebb-be39-d3f51da4baa6@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <83fb4a66-cf7a-4ebb-be39-d3f51da4baa6@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0191.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::24) To SJ0PR12MB7007.namprd12.prod.outlook.com
 (2603:10b6:a03:486::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7007:EE_|IA0PPF89A593F05:EE_
X-MS-Office365-Filtering-Correlation-Id: f842e5e6-a8ff-443d-f687-08defc75b0ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|23010399003|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: iJ2p/tvQ6ejkSA4bO/3LnRxfU3/UCN/ZOGj/iB/RUnW+dcM07Eq92f3Rcc56bg09zd24So4DbmbJiKnlZ8K/a2ZGRjM0soVSNdctDJJ2cqahGoKuPi1YrVkegelFP9XcGL4kLKYmJP3wMeNb+Wc69iDfBfNqxx42AnASNFpcpjJv3PoB8p8fwbccX3fRJjzh0dKnASBdEb/OoxaH/J8R1U9RRGsbp85VkDvQl2MY1hIrE6NTqqNc+OwSjGC0/XoqHpryPE++KsDgklXS7WBs51LFt75WLCFVQZ5reXwBd7mWV7MXEmQnAd/uEvtWafDHWgn0rUl2AZTbw0ONbjUKMZWSKA75lOZAeX9t4NMntYdFT2jgfPvlgir0oLHSGGuIxDxDTy3e7iXgtJNMtrrtsnjaikMvhuELOHNmjyMjiFGuGHKQCKe+LwhhPkNsIGDZ++vLnicKyYM2H+wdTUI/YYoHwqI8+WGhF1nGtRd/BVv9pZBEFQNUIyL0eFyA73afVCiGybSJFxxYxCV/tIyU1XQrzqeehJ2IUf9NQCqlwqurNkc0btR5/BU2kJrDY3hMqa6jehYqZRgair89iLic0gP3hpiroi9aIspYPHoyr2jwQRyeLoLGT6zc7QH4p0WHMT/I/ykFRO+ys5aZ6S2Bcq+rwNNw4m+DZ8i5itSx4kA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB7007.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NktYMHltQzlta2ZVVklNV1hmVnRGN2JLbW5JZ2VFa3g3UmY0ZXBqdmhIQlpZ?=
 =?utf-8?B?a0lWdFJ6NG4zLzdTb1BSNzRXUmpLSmZhMG41d001enhYdEVtRGNXYmk2T1ha?=
 =?utf-8?B?WUorT042WDZ0SndReHRiTkRPMkdoM2hhQ084YkxTRnYxbkxobG02RTJ3Z2J1?=
 =?utf-8?B?RGJXK1NMSlVzMG1iaitzMzlaRDZKMmJrUDRpR1VTZHo4NU1kTk9sYjk1WlF2?=
 =?utf-8?B?Q1RTRFZqMEU3TU9Dby9PVFprWHVodWFzZjNnZUR0dXp3ZFBtOFExaXdOUSs2?=
 =?utf-8?B?dnlGdSs1SFVNcmUxdDN3M093RDFMVXMvRlRuK0RwdUhmSU5ERGc1YlBDempx?=
 =?utf-8?B?ZUNQR2NDZXlzanlOQUNWZTRPZUVMM1JTMU0rbUtOTWswcEZiYUZsNnRJSWZX?=
 =?utf-8?B?VGhRMkNJdXBOZ0E2cC9ybk9CQmk3S2w5VWtpWTVrU29HaXp5ZnJzSFl3bVBt?=
 =?utf-8?B?Q3UzU2ZhbEQvclFEMXIxc21DdmpnMFZDSDVVMFMwcjVBemxsZU0remtJTVo5?=
 =?utf-8?B?RzNJNkpDQWtHc2JKODlBSkl5ZjdEN3IxZ29QUzc5dUE1ZHQ2OEc2eDcrT2hJ?=
 =?utf-8?B?WVJLZ05WcTgzemNYeEtQdzVkT1B1M1g5ajZOVjZsZTN3SHhrVzBmdk8vUXcw?=
 =?utf-8?B?YU5zVmhLN1pleTJTTXp5U2NQdEl2VzZscDRKSFMwMGZRWEkrZG1OcVhxdzg2?=
 =?utf-8?B?MFFPSzNzcXhqZjdxMVR2ZGFiUkNwemFOaW11MTVMeFZqR1ZiUGNqUXhTL2FS?=
 =?utf-8?B?N0pTcUZxeHFHVEpzdFdoOHE0M3R2SzFocjI1MTRvT0c5VWdMaGNKYjRqNjFa?=
 =?utf-8?B?cEV3Wk1La2I1VHl4aml2cGZkNU1SbUdNVWRsRVRTamlNMVJBS0FYR0d0WHFu?=
 =?utf-8?B?d3BOZW53YUdxWkJnVDEvZmNZb0JaTkx2TXM0Zk85NGhMa0V1OExXT3FiNHpJ?=
 =?utf-8?B?aWZLZ25rN1VCeTVPMy85cWRoZUxyQWJLcjJETmNxN1gzbUZZTVhKTWswN2lC?=
 =?utf-8?B?WXViem1ObzQwZ3VuczJmTHhZd3RKekZ1NC9sVFovR1BQMXp5RzRzbzhaZXdK?=
 =?utf-8?B?YUZ2cjhVdndVRitCcmZVQW5LN2hXVWozbHlRaHVwRHNRdUlHQ2RWSS8yaE02?=
 =?utf-8?B?N2s0ZmIwSy9vSTNMT1ZMeFUrOWhpTWxBVDBxRktBL3k4RlRvSHJaOHEycWcv?=
 =?utf-8?B?RGQwakkramVjQ2pOckhIdm0wWFRuL3NYVmNqQ3RVY25kK1VyNWpGU3RuUmRw?=
 =?utf-8?B?N1BvQ1RoRXltM1A0RGVqMHRnTXFkZUxXdWRWQmgwQWl6bzU1YStxNjg5ZEl2?=
 =?utf-8?B?M2Z6NldFNi9LVEovWi9XVmlIM1M4bmxHRzRscVVhZElKTWcvUExMZkkvZWdi?=
 =?utf-8?B?d2R0R1FwYllwQXpVc25aMUVIRmNLQlFHRURCem5VYk4rR2VFYzgvaUdrS2FD?=
 =?utf-8?B?VWJoSzFGUm9wakxtS0RPNEpxcGtrd0R1dG0rN2lVNzVWS0pHb1ZMN1h0THZq?=
 =?utf-8?B?MXRrQ2VISzFyTHUvbVQ3enk4TGlLQXI4RFJNUlJVRUZvMUxuNkQzUXpoYmRp?=
 =?utf-8?B?RW9vREVKcXBzR0lEUjdpS3NLUUp1THdNS2UrNXBtKzBvaDg5N2VNbXZqYkNT?=
 =?utf-8?B?MlgzazVCUkpuV1I2OGt4czlacFV3aW82QXJKdFlhRGdRUmo1Ylk3UHNXdVli?=
 =?utf-8?B?QzhvUUtoazB1L3hhMHdiY1JsVUFHL2xHNEdPTVp6OXMzdCtKTVZibW5IRUVt?=
 =?utf-8?B?WFIvSlE3K0w1aFc1QkxiaUdsRTZlLzNFOU9adC9Pdi9uTE5kUXZSc09uTXJs?=
 =?utf-8?B?Z2kvaDBTT3ByNnQ1ZkpWR1hPK2FsOXo1cGw2S3NkMTRNYmgvTnVDRk14VXVj?=
 =?utf-8?B?RjN6WGx2eG5IQXBtMlNjcVBvTExTdzB0USszS1B0Z0VtYm9KcXJ2V2M0ejB1?=
 =?utf-8?B?Qk84aFBUVWJWYlhNK2NtOVlRYU00ckswL3hIZ1o5R2hDTmRyMTJrRHFnTVlX?=
 =?utf-8?B?NGZsa1JFZXRZK0VXREkvZzhwRU55eXB6c0ZJdkN2Y2wzNEhROUNjeHp3b2Ez?=
 =?utf-8?B?aFR4azVITmZrRGJLaUtKblNMc3NDOHZXZ0k3czhYRDc5dk9HR0RwZjVaMUFu?=
 =?utf-8?B?V244OThqS0x1K3VvcyswWnNGRVlRN3p3c2ExUHppNkIvNTRFbjF6cjJCa0Rj?=
 =?utf-8?B?aW5Kd1dNakpNcmJuMmFtQjRmdDN2ZzZVMjhPM2lkZHB4OWdvRjhBTVpENWFW?=
 =?utf-8?B?N05jVXNENHNoS3dCNzh6YjQ2d0YvKzcyTVVJM1oxWVFCTFc1bXpGSlZReGdv?=
 =?utf-8?B?VHQzYXVlZytHS0Erd0RiVlhNSDhZMkVkUEJydjEySVhNQUgvdnhrdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f842e5e6-a8ff-443d-f687-08defc75b0ad
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7007.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 15:39:14.0189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Xv6iQ107rnb4DVEnaFSJYeEe3aCE+Uf8lXM+lS9QQe9hiPOBuDtReD6qCuHnohz+zfMR/1D+YlB7MT1H0dGuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF89A593F05
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



On 2026-08-17 11:19, Melissa Wen wrote:
> 
> 
> On 14/08/2026 05:55, Alex Hung wrote:
>>
>>
>> On 8/11/26 08:23, Melissa Wen wrote:
>>>  From documentation, the test requires i915 or xe driver, so make sure it
>>> only runs with intel devices. In addition, it's a CRC-based test, making
>> Should this test be moved to tests/intel/?
> 
> I kept it as a KMS test because kms_colorop relies on writeback support, but writeback isn't present in many drivers AFAIK.
> So these CRC tests can be used by other drivers if they don't support writeback but support colorop.
> 

In that case the test shouldn't have an igt_require(is_intel_device...). It should
use a generic check to determine whether it runs or not.

Harry

> Melissa
> 
>>
>>> kms_colorop with writeback more aligned with color testing and
>>> validation. Other drivers should work on adapting this test to their
>>> needs if they are looking for CRC validation.
>>>
>>> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>   tests/kms_color_pipeline.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
>>> index 78860a845..3978745a5 100644
>>> --- a/tests/kms_color_pipeline.c
>>> +++ b/tests/kms_color_pipeline.c
>>> @@ -372,6 +372,7 @@ int igt_main()
>>>           igt_display_require(&data.display, data.drm_fd);
>>>           data.display.has_plane_color_pipeline = has_plane_color_pipeline;
>>>           igt_require(data.display.is_atomic);
>>> +        igt_require(is_intel_device(data.drm_fd));
>>>       }
>>>         igt_subtest_group()
>>
> 

