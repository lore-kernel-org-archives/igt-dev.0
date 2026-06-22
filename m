Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D997ACDB46B
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 05:09:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5A110E498;
	Mon, 22 Jun 2026 05:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBqcAvfE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C340B10E498
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 05:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782104958; x=1813640958;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=f2igeuy9fcgM9IfWblp03b7VjDMWxdHAPUWcO94OB6o=;
 b=VBqcAvfE9KfYuCQm1gGLMdVV2NcINKNpyhRaPgF3ZzKJcFBtPIzD3paC
 SPmazO+jsu8tCFM6uvz4riRNsA6hT/OjRSI20xNc+Cz46eH/PGLUP1rfT
 fKBdbwxAh6vhJlb1crq4XWSDM1ZcQQxjPgQmjUdaMP7jsD8oqsXcwFddY
 iVE2l6naEPZc9Zm9nP0sXAvJWdzPYIaapT186pM5XqT5wKW355MZaXVu6
 6Z320BaS5S/sz/qD1mgi3E6Dyh8/fGXJms7x0oUNjWVDHPuy9iG0QZHkE
 IqEfGPj0mxeNseLFLl3gaU0B3JfuaxPs8P1cWOVc1en8LFqx8nxIV6Odh w==;
X-CSE-ConnectionGUID: 2hZRHzenT0avw4xtUeurvQ==
X-CSE-MsgGUID: 7a7dyJppTjC9FyrrJNQb2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="70341167"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="70341167"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 22:09:18 -0700
X-CSE-ConnectionGUID: PWwAwmUsRJyj+5cDTuxpPg==
X-CSE-MsgGUID: Yx1iq0kuTByrrfVxA2ymUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="246199715"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 22:08:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 21 Jun 2026 22:08:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 21 Jun 2026 22:08:07 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 21 Jun 2026 22:08:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgVu9SyuKMMLU+3Wt9sZ+nJLpJ4oSFNHn7OLPs6S6iLRf00BhQZOiBIxie+ssdlo0cRglnRkDEp7Jvgt26Sfehg1ETCsP/wUzVyaufU51PrzeFOfToWMVitKIPggq9JZwTIGAyaUWOID8wt3PU5zjMsWy8JMHs1TPAHH7VkuwBak22LAZHtYCHqCMGodmwUEd2xtxEzAAu5BaOzbnegawPbHmcypOO8h4kzZNhr1uMPZUR16ynCRssTR5HXnGd6AooIP8+ewgL0ozzc1T0zP/6CHj/3Be50J35wWAzTM1Gz5K8vePd4zWQaYUE0HWcyppV2EcqZRpfmu0KqLNKFHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+PPMQdvbNAeAzVU14CtZDianWvJA2ux3vwkQknKsJo=;
 b=OqP+Fs13W/hjyJBe7h+TRlwLOnT7ZgsJPpQaVpN0SE4Nm16NXznDV6F2bPJj7ZVCL2lVyGSaXp5Zt3OWVQsU6zu11/CxQiTV4dMjoP4ge72JrdbkRYMyEiBZ3CY4v3PjgUd7cuNOses3/mQ6EXn1eVGnj9FqXh/EwAyp8GnTE+IIN/iK0S1i0v6NoKXRROk8fqtsBm/71hrypeUJQ8iWiEQpVHX33r6u5QILEhnoLu4cTEQ3KcrlIdx7Gi1x3p3M0qtrYl2IVbIgIl4SxUSqjQuuVZqHgv0Cc8EcT7AmZT0Ak3PwvjogoIVKn7vabcjuFi9V5h7wp02CIkQrSRdz+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MW4PR11MB6764.namprd11.prod.outlook.com (2603:10b6:303:209::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 22 Jun
 2026 05:08:04 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 05:08:03 +0000
Message-ID: <0db601a9-2a7c-4936-9b8b-334754c466e4@intel.com>
Date: Mon, 22 Jun 2026 10:37:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_dsc: Ensure non-joiner modes on
 non-joiner subtests
To: "Sharma, Swati2" <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260618043055.2998900-1-karthik.b.s@intel.com>
 <b16bd582-c1bd-47a1-a23e-5ca06d29be2e@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <b16bd582-c1bd-47a1-a23e-5ca06d29be2e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::14) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MW4PR11MB6764:EE_
X-MS-Office365-Filtering-Correlation-Id: f476592e-0505-4871-ace7-08ded01c3cec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|42112799006|366016|11063799006|56012099006|3023799007|5023799004|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ErU5/45LWrJ/cp0zmesVZOpQRNqoCpXAxU0AQLaKk72K/r8BjuQi4dha/5ceoWCmxTjpBhkvqJ1t5wSvw/CorDlCmxwRCtCcMiPlwYQMN7tQhlZX/WT5kYw7Zen5b4/rWtipqoVbVPwrc0v8V8+HYPhdNpziDuqzLHwVaHazW5rT+A1qtrpbjU1dwKS0wFXH11AvHsLOVqbfnxh9P7ek9qXzphliaNFBbBFBYNQsSmCIGNGUsJK6ULUOm8yZiGwi9c8cLkTY4npcw9o8vC1fkYIA93eqW6/mtJIAzkCGWNXFgfMFoA8YHER9HnO7Jfmm+/LtPIz7t36mL3vSFqU4n6G0H+Vai9Ell9uBUbrDySXzhwjQTy4A2gdjKv7VnVAJm7uIMQpLZNcC9UwH2eHVHgRMiO0+W+5mdec7JWTANsZtzUgPhBzLZmJSf1Uurn5+A0bt84MPZqa/0kd94gi/ZCNr9zJUnKch2Cz4nfZwKSLWklkLDSBo2sfA/z3CEDCkNSxP0ZLarmJ6HpO+lCBfZ6apvFDL1VnZt7oI0qsI53kFVymPSinO4ZecG1Izm9I6dEf5flQC2BfzQae72y5Sgnqc5KDnJVQ+Kfie3eVa/Br/MXVHEih17BuzDDI8MFLt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(42112799006)(366016)(11063799006)(56012099006)(3023799007)(5023799004)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzRSOVU0RS94YVpHRnRzVm9pSlltNk9SOUVFRGFMTU9Td2p2VEp3N3hZaHRE?=
 =?utf-8?B?eVZ1RkRNaFNIYVhlc09weDI4OXJYU2hyRllSeHZzVkpkeUVtSXdnWDJ6Y1Zy?=
 =?utf-8?B?MDc2LzZZSlpNbERpOU8zNGdnYWl6YWcwRzI0ODdnTHk1NzRjQndndVBGd0Fl?=
 =?utf-8?B?a09RSDVIMUx6S044N2RNMW9GcGJDTFZlRXdiaHRzdldtL3J2aW84RDNlQjBO?=
 =?utf-8?B?MHZPQk5pcEtSYVA5SjZUSXRBKzZhdDNtdzI0Z0hVSXVYWEl4MmRVaGxkOUVY?=
 =?utf-8?B?RXZXd2N0MStsc0dva2RVejR4dUlSZjhzT2R3b2I2dUtiblBkV043TDV2d0g3?=
 =?utf-8?B?a3hqOEpXSW80THVMVVIya1BscTN4cURUK0xrT1FUMlBoTXhBTDdaY25VeG0z?=
 =?utf-8?B?NjBnTjRCMTVxU0E3MjVGK0s0MUJhaUxNTGhySlIwalUzL0RWS1Y2MVJrVkFW?=
 =?utf-8?B?bHRDUkl5bFNXV0ErR0FLbndYeXVyQ1VoL21BM3pvNTd2R2UySmRUZlBobDRH?=
 =?utf-8?B?d0FqTThCaHdHc3c4WnJRd1ZEY3Z3bExGQXpWM0hTU1QxZCtEZVhzaTJPVGZZ?=
 =?utf-8?B?UnRhQzQwSmEyeHJzRlFNcUVSeG8rZ3gwbVdhcWhaYW5UYndXR3VPcWZNbTJ2?=
 =?utf-8?B?ekFXZkVHdDBBcXovVW5oU0lqTTE3R0xWY2xrNnVSNFFjQW9WRXBNbVNpMkxo?=
 =?utf-8?B?c3NrZ24xa09oYmdFT1BGQ0xHdDQ1emlXQzgrRWpsSUUwUjlVbDg1cnBVUjQ3?=
 =?utf-8?B?ZGlLT0ZrRUtsTk1CbHh3TkdDOTRQaXZRZHVyWjBOT0x3WndkeGgyL25LLzhP?=
 =?utf-8?B?N3orOElweVRLT09waDBnbUt0cXY1ai9XdTNNYXVxdy8rRzNWOFBpdjRIK0Ex?=
 =?utf-8?B?ZkdWL2lLOXo4OWJxVGIwMjdjaG1FTHVOak9kaWhWSnkwMmJqQUdEWndnM1Zx?=
 =?utf-8?B?ZFltNHVhTDZZQm1kcktZNEpvTW5pS3BPcG1aRXBDWndQNGliTE95NGJhN28y?=
 =?utf-8?B?U0NaSmI4M1JqRU1JNVB2blh3RVJ3VVRpaUhKQ3o4aXl0aFcvYzkzbjdtc1Rk?=
 =?utf-8?B?enMwYXFRWmZnTWg0ZnlheHZEZ3FwdU1OdmxlcnNPWTdJVGtoVlZZVnlOZXBo?=
 =?utf-8?B?NjdRRjBZZHdVQThXTUZlNFpiNHpLWUlTQUhST25wTEc5NGhHT2luL2E1YS9k?=
 =?utf-8?B?aTE5b2tvOTdUR2pnWEl4STNtQjNwcXMzNEFLaWZZTzA5WDBQcjZJL2RuU2JD?=
 =?utf-8?B?UXF5aSszVndvUW9OSEVnL2cwcVBIN0RtbWR0V2hQRTZ6VnUxaUs5TVhtV1hB?=
 =?utf-8?B?SHZJcG1DQWt2L3R2RU9IdG8wQW5xZ3c5TXU4YkNhOGpNeHhmQ1RBR2pYZ0dS?=
 =?utf-8?B?MTBFOU9YcmhKZHpVeHBQcE10RUpGa25aQTV0WjhOL1ZwZWJEMFduRThsM1JV?=
 =?utf-8?B?Y3VGWFY5S05MdGJlY2xVaERpbzhOeVdkTmRHbXY0Tkc2VVE2ZlhHZkpJVDlD?=
 =?utf-8?B?Qzd0R2k2bzZKdXphcHNYYk5HRWxPcnRqNjVoMnM4Wlp4ZHhnVXNRUjFLaXBV?=
 =?utf-8?B?bnFhTVpXSTBVeXdKVlB4RHpSZE9kSno1R2Z6b1NBMWppZi95bzFGRzJlVFpP?=
 =?utf-8?B?MWRQZERzOTZ4WndYTXQ4NE9jUDA0T0FCTnl2Q3Z4d2lFamQ5UWpzTW5HL3RJ?=
 =?utf-8?B?T3RNdFVkQW43bG9RbDJpVzZYdFNaYWFVVXlXdFo1Q3lvU2l5UU85MGo1dVZS?=
 =?utf-8?B?SVZ1L2Y0K3RZSTBOTHBYQjJha1c0dEJnY2ZNc25kd2NKMWRpdi9uaGZCT05p?=
 =?utf-8?B?azVxR084eGFUQVhNd1RHN3BHbllMaHptaEdsa3orYmNhcTU5R0c2SituMDAx?=
 =?utf-8?B?bjJ3VjNnbGd3bzY4anc5ZEVNQTFXYWs5T2V0VmxNVHpISjM3U3d1anN1Yy81?=
 =?utf-8?B?bXlkTGtGUnIxcStKWjE0a3haUEcra0R6WlEyZWJwL2J5ZWRQY1o1WWdwMEVU?=
 =?utf-8?B?bFkvbTNIODBhcTBZRkV1NWJwN2VtR1MzanQ5QmxEekgrSHlQYXRJUDR5cEp5?=
 =?utf-8?B?UGtWZHM3d0V6RHNUM1AzaU03MmpGSVA1QmMxS3FtQk9wWS9SUVg3QmlZaEJy?=
 =?utf-8?B?ckJQMXBXK2FuaDJQNzg1aks4OGNtQ0Nac3JDYkFDUUxLclNGZ0NDS3M1N1pl?=
 =?utf-8?B?a1ZVRGZwajc2a1A3RjNkb0dwZ2F1cFNUaWF2bWRrUFdvRnJNWXMyMmxmVlJt?=
 =?utf-8?B?dXN2MHNxcm1KQndKVjZEa1YzVTEyVDAxdm51UXF1cENGZmF6eS9XODJSZEJv?=
 =?utf-8?B?d0pkaWlRNDd4OFI2RDM5aUVqOGNWNHUxbzVDSElUMzlzazdOOXZFUT09?=
X-Exchange-RoutingPolicyChecked: H7UYKnFxiVsc7QECoxx3UQt2pUd1PtBc4v8pR+Oy9rIX1LLcRyZKZwuD3IR5w51CKZjwup7c2J8g0H3s0hTFqpeGIkHihO/0F/7GYFMqS2BuE2S0tEKddzPDyS6pKkdXLaPPb6ILx8TecshVCUg+zHkN2W1DJRahfNA392Q65UKKB6Cp8Iim11ROc7JqrdGimleSHBv2mKypbI20axVzSCVb6ENQfeQPTfMaPLITSkyZeT4Qlkvcv0OXdZP5AXqjnXoE+f242NOIuKG+vVxhWxhrhtsSTNYrasKc+n71BQurRc4YmUgltU+3XYKzFID/7sM/Ss5lnIDDH44MfiI1Fg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f476592e-0505-4871-ace7-08ded01c3cec
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 05:08:03.7517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+COspeCreVgveVzUrlwaVnYmKe/BLPrcmE2Fn06zx5pE3AYyzL79dvz1u6wTAUUTVn0pMnzpo9yHbUKYYvcmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6764
X-OriginatorOrg: intel.com
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

Hi Swati,

On 6/18/2026 11:32 PM, Sharma, Swati2 wrote:
> Hi Karthik,
>
> Please fix the subject.
>
> It should be tests/intel/kms_dsc

Thank you for the review. Will fix this during merge.

Thanks and Regards,
Karthik.B.S
>
> Apart from this patch LGTM
>
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>
> On 18-06-2026 10:00 am, Karthik B S wrote:
>
>> Ensure non-joiner subtests always pick non-joiner modes while iterating
>> output-format modes. This prevents accidental natural joiner selection
>> and avoids failures on the last pipe.
>>
>> Closes: 
>> https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16368
>> Fixes: 86679142531b ("tests/intel/kms_dsc: Add force dsc and joiner 
>> variants")
>>
>> Cc: Swati Sharma <swati2.sharma@intel.com>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/intel/kms_dsc.c           | 4 ++++
>>   tests/intel/kms_joiner_helper.c | 8 ++++++++
>>   tests/intel/kms_joiner_helper.h | 1 +
>>   3 files changed, 13 insertions(+)
>>
>> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
>> index 3687e795d..8161bf7da 100644
>> --- a/tests/intel/kms_dsc.c
>> +++ b/tests/intel/kms_dsc.c
>> @@ -251,6 +251,10 @@ static void update_display(data_t *data, 
>> uint32_t test_type)
>>           if (data->output_format != DSC_FORMAT_RGB)
>>               mode = get_next_mode(output, index++);
>>   +        if (mode && data->force_joined_pipes == 
>> JOINED_PIPES_DEFAULT &&
>> +            intel_mode_needs_joiner(data->drm_fd, mode))
>> +            continue;
>> +
>>           if (mode == NULL)
>>               goto reset;
>>   diff --git a/tests/intel/kms_joiner_helper.c 
>> b/tests/intel/kms_joiner_helper.c
>> index cd7fe86bf..da0ac7f62 100644
>> --- a/tests/intel/kms_joiner_helper.c
>> +++ b/tests/intel/kms_joiner_helper.c
>> @@ -225,6 +225,14 @@ bool 
>> intel_max_hdisplay_non_joiner_mode_found(int drm_fd, drmModeConnector 
>> *conn
>>       return found;
>>   }
>>   +bool intel_mode_needs_joiner(int drm_fd, drmModeModeInfo *mode)
>> +{
>> +    int max_dotclock = igt_get_max_dotclock(drm_fd);
>> +
>> +    return igt_bigjoiner_possible(drm_fd, mode, max_dotclock) ||
>> +           igt_ultrajoiner_possible(drm_fd, mode, max_dotclock);
>> +}
>> +
>>   /**
>>    * igt_is_joiner_supported_by_source:
>>    * @drm_fd: drm file descriptor
>> diff --git a/tests/intel/kms_joiner_helper.h 
>> b/tests/intel/kms_joiner_helper.h
>> index 692dab022..a0ab75b2c 100644
>> --- a/tests/intel/kms_joiner_helper.h
>> +++ b/tests/intel/kms_joiner_helper.h
>> @@ -20,6 +20,7 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
>>                     uint32_t valid_pipes_mask);
>>   bool intel_max_hdisplay_non_joiner_mode_found(int drm_fd, 
>> drmModeConnector *connector,
>>                             int max_dotclock, drmModeModeInfo *mode);
>> +bool intel_mode_needs_joiner(int drm_fd, drmModeModeInfo *mode);
>>   bool igt_is_joiner_supported_by_source(int drm_fd, enum 
>> joined_pipes joiner_type);
>>   const char *igt_get_joined_pipes_name(enum joined_pipes val);
