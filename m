Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6E3C79F99
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 14:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D2610E5D5;
	Mon,  7 Sep 2026 14:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ey/iP7v1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210C410E879
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788791686; x=1820327686;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aguw0erMl+du294MuqNDh23ZDEOzf08HA636l5G78vI=;
 b=ey/iP7v18aLwvgeHzj3gPy6ye3x3HqgyNxi+OzG1p4ZzvZXVdrSz/Grn
 6Oeuq1+Qut1hJ2RI2q04gXJBdDR+Wi9rYY9kCWINIR6GoKayqyLgJ9Gy2
 nhmr4Iygj6mkizZAudkKUetnA7shTviOKqDfS3Y8xvNSNF4m8bvZXPxw6
 A1pbodFolClLK71KPkid6biPrEyRcswwyJZv83wUxYX1PmaKGMCUrbeAS
 BYzMkePpxHf4WHlYGtUAnapj3mymIyjoGabPMoauHht4ccyXqVoAOz/Y/
 lky3C6u8Va4rxCs4gXSY3YujXhr+VTlDSVsArOoWTWPLC3lQV6oVG2QyD g==;
X-CSE-ConnectionGUID: M6THrqJ1Slil8zZuyD/mqg==
X-CSE-MsgGUID: o5EZ3HJbT4S5fDaG/pptJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="76754868"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="76754868"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 07:34:46 -0700
X-CSE-ConnectionGUID: s0vIE44aTguIzLAKyj2Btg==
X-CSE-MsgGUID: OX1d9G0gQ3uPGwDaezFj6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="271255385"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 07:34:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 07:34:44 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 07:34:44 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 07:34:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBRYi6uLFhhJVgZ+XU+RPSKjWlJIzDk26z9+FqiiGiU7eoRBNiRrbqC/LIb1BNWsQAG9ka7jcbv39WYDTbPyeTi0BioLv4zCsRcnUQc7m0iI7+hrBQca1s+7mccQU4XhVmuLW/t5KM3z5+ql/Dra/YpRoajsmsenstyydHVgy6vFQk1/a57Bsyt1okj+PyQhyOdiVXsS2g+NFLBZdihONBJVtNTwtSY0ei9/CxTVNrn0MHJhncQ69R3+LURENPECctRdL8ZEkh6EkGoitYovXE2kZ5P4kTL76rbIvW7r5kh44XfArAso46HDMPkBi9a843EsePZLbjpArh8VZ5j7zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPx+62mPdZg40iAlCxg4le8evTEymPW6ir5GwVhlw7g=;
 b=DxpMfcpz/i1Zu7dpeANzfPSogS23PrGy9g/LVVTPrpnPnuubkBSNHa6kGQWnx//Lp1FdDlzSBqJxUzECnGwY6Eyg/W/sZzfaDoTGMTofRRCKscdqjtET/H45YuD4ceZ9ErWasLl9vOkw6X7q9dI2ZAc71kyx3lPiVraMF68uqKixkwkTsaaUUh9k7Gt8SrBWUMaYYpgIDWPGI64GIMTxnsRMJrrkFNdVGDxW6H+0nVoCnAvxLqOV9h+cEis9GkYWOS88EU7cnQp/GBulja1KaUxu4+yNE7i/PeKjrDNE5LATEnUlLmuNaDQtBxXeBpS4te9XdVzxtIEVdA8lvpB15g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 7 Sep
 2026 14:34:37 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 14:34:37 +0000
Message-ID: <e23962e4-41bf-439e-a3ac-27de1f1b12a9@intel.com>
Date: Mon, 7 Sep 2026 20:04:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 2/3] lib/igt_vrr:Add VRR helper library for
 display refresh rate testing
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <mitulkumar.ajitkumar.golani@intel.com>
References: <20260825183359.2791891-1-ramanaidu.naladala@intel.com>
 <20260825183359.2791891-3-ramanaidu.naladala@intel.com>
 <23fa19f3-b3b7-4d84-bb29-1c32e81c1a90@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <23fa19f3-b3b7-4d84-bb29-1c32e81c1a90@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0151.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::14) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|PH7PR11MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: cd08a192-586a-4e09-58cf-08df0ced2496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|3023799007|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: VAQYPm23pDoN0zCn758YjdIkkghNAvjwbd2nqTpHBu0humj5M51YpU+YkuFQuqgniOTOiS2X8Kf+JxGTnilXhT62qmJE7t2Dcs/AQJaHjir3yVESJNpsm3n9xPoG97khzEWl/Oe0diBymfeVdXGGWbOkiPSA8uI0IS0JlBh5jWYZll1rQlFuPA4qEYYTw9Eu90vKcCt0UeYjUc1ejg4nlvtNXv8X1+ZP4dUQNiJ6a6y7e+gKdJEkycK3zL1+iR9zoCm+53QmGYOcXO84gq66u1bEzgmnqNUMg0yX6cG6kWM7u5DmxC0jxYssZf5EfJY7MC+1VtjqKA9ZMPzaIpzypwQJtOi2f+Fk8mOFtQ1lV+xhdk+gxDwuIPB2s4dhtBEDgCJddttNHZQ3PpBr769Ja3GL5a6SlRiyPlZTf14TVUn+rZerKFWbhCx2JZ3oOlKsiGbX805I3sUBKftVXICAKS0Lighi2CragRfi3RxbvnrilczOMHw77B/oTrAWS9O8mka76zBE6pTxTdCA/WXW/MiItcJHv/uErZAlhqlnLcTz6OOlBDDhnbJidFN1ExLjK+WOK0wBygOwL3mcN+xmtkP53UqvW8Qg+WJhIXvViED5QN31soSqPvqi6E1dHrBOWW3M9AwOjglHO8NTtRucUwGOCv5YXsXuQTokJktajk4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0pyNDd6dU9ueGZlQ1NMMnNFYTdxd0tOa2czbkNpNUl1a2x3eUJ1TjVNNDY4?=
 =?utf-8?B?eUhVMFYxbVZMV3c4TXlsRW9pZDgzTk5JTE5meWNGdmIwOEZidkVCd2xpUDdH?=
 =?utf-8?B?S2N2TGFGVHY3TGNJZEdub3h4ak5mNTg5YUZpYWx3cFZDdlhTbnhTVzdReGVs?=
 =?utf-8?B?MlpSMEU3VWxqZ0JEbjJ5Q0lHTU94aWxuSStPRnR4KzUzU2Z6WmF4ZkFBYTdp?=
 =?utf-8?B?MWY1QUZEVklyUWVLaUdobVY1SVdYZE9NNjJQU2RibzY1VXcyK3phcyttaGtw?=
 =?utf-8?B?ZDF5MGx4WG9nMElzQVlrZm9EVHFySTdJankzTFpwcXFxTTBsa3dycDNQc2lt?=
 =?utf-8?B?ZEpuek5pVk04QnFIZ3FvQi9pdjR1VzVrMDBQTGp5WW1UbUhLNlJBalZvRVdE?=
 =?utf-8?B?S2hQeUNGdDJreVBmdmxmS3hqdzYxTmpsTHhGU01nazQwR0pQb2loMFNsK1Ew?=
 =?utf-8?B?Q2EwTkJxTnVHRHpXMEozTTNycWdxeG15L09DY3hDN1FZOFc3VVBxNjNWaWV4?=
 =?utf-8?B?eEFyNWFiTXBDb2J4V1lTVEk1bElVY0xpS2YvME1mL2FKenB3Njlaa0hiekN4?=
 =?utf-8?B?Q1dFZGQrcTBvTHNCTGtWSjBEbks3YjI1Nm5neWkvZ3VjbEI2KzR1ZlN4NTRV?=
 =?utf-8?B?ZTZXUzBSZVoyVWxJaURPbCt6SjZHdWt3OFZkWlN6a1l1dVlMdm4wTTVhOHJs?=
 =?utf-8?B?Zzd1R3UrVHZ1Y2FidmxDZXp3WE55MGJsRnZQUHVsVDVZWTEvZUV5VmhoaVJE?=
 =?utf-8?B?OWJSOFBaS2Z6UkpwMlVYYU5pYkV5UHNvUkE0L3B5dnVNVXVLTFJPRHNGVGp6?=
 =?utf-8?B?MndkZ0NEM2I1cFg0NUhRTDgrUkVhS3hjcTE4VG9QSXRzNWJuRVEzWHRXRXBz?=
 =?utf-8?B?dlhaMlp3WHJDY1RBb0traXhZc1VkeVFWRHBnQXZrSTNqVlJrZTBBZ3NuNFN4?=
 =?utf-8?B?cTJWVmVNMHd4dkp2MkptTFc0YTBkakxrekhkdUVhMHBuWFRoTk5aNEdWdmMr?=
 =?utf-8?B?RzZ1NVVOZzBZU3JiMXpBd3BiZDZiYWNwVXRDS1BXTmh1eDZiTVdCZWJuU3FP?=
 =?utf-8?B?Y0szL0RBdVcyNXJXNCtXZWR6VEJKeXU4a2N5RkpCQy9lc0JlMm5NK2R6RW1x?=
 =?utf-8?B?WnRaZUw1ZTFDT3NxT1FyOVlxVVRqNjZsV3c3bDVaNENkNVppU1NuN0VIR3NZ?=
 =?utf-8?B?VUJrWUY1by8vMU5iU2xEVDNic0ZXSWRsM2RlNzg1R0xmcm9Gc291bU4vYVh3?=
 =?utf-8?B?d1RwWXVPaStOMTZySkhDWEZhYXNsU2EzK2pKckZ5eExHZXJMbGE4WEZ0TWhN?=
 =?utf-8?B?anB0THQrd3BrN2V6SWdHN0gzSEJkaGN0Mlc4OCs1Z3VpYXZ1SDFKdmNUZGc2?=
 =?utf-8?B?NE5Ja1YyRURFeThzeFNJaUs3cC9XQ2o4R3NrOUFxNERoa0k1TlJmQjNJdGRL?=
 =?utf-8?B?RzZjd0JiNHptaUhJbVRiOWpscm94VUJqemRzUFZ0d25EbXIxR2lodkp1TE13?=
 =?utf-8?B?NE50eVdqTjNzT3ArMmwzMUJ2Z3hPMWo4dGxYa0Z2ck9MNzR1c1JFUzVWNi9I?=
 =?utf-8?B?Vzd5azZXR0xsNlBHZkxNK0J6N29EL1hxeCtQTDJqRE9EYkVWV1lZT2VVa3Zi?=
 =?utf-8?B?TXBEUDJFay9nUEpVNE5tRTBlQWVqRWtQbnZNZW9WV1h2ZVE5eERxRlM1a1NZ?=
 =?utf-8?B?R1FoQUsyMzB2QUN4UXIxMjBCaXMyTGtxcTlNK20xZWl0ZDFiTWZHSVBEYTZ6?=
 =?utf-8?B?ZkVROXJES0ZnZk9nOGp2WGNWSlFNSmpSamd3a0lkT2dINUh2L3hKMFRENFpF?=
 =?utf-8?B?a2h1UTVxeER1Mi9SUDR3WTY1TkE4UnM4ZzlCa05iV1FqbjlpSTlCenpQWTdB?=
 =?utf-8?B?WFlaSXVJMHoyTUpkRmR5NHRtREhaYkZSZXBPTXMzRm93elFtK3hxS1ZqWG9r?=
 =?utf-8?B?bmFkTWJ3UEZ3WG5FUzViMk1VRzJrZUdmbEpuUDNSQXB4S1RuWlp3aFRZclBv?=
 =?utf-8?B?Y3BOMjFiT0E5RTR1cU05RDFaT2VoT2I0MWpabWNJY3k4WTh6RDZ2ZWd1UGQ3?=
 =?utf-8?B?YXNEYmlTUHB5NE5ESUQ3akt3NjJRZ0l1QVhZc3VRMWdUOEhKUlhEWXE5cDFO?=
 =?utf-8?B?TkFOdFhwMTFNRmpWRmppeHhhR1htOEFJUzhNeWgvN0REdVNjWElzMVN1bW11?=
 =?utf-8?B?UllVZ3NvblNLZHNkejY4b0JqY3EvbkJIby9QdkV6SEtTUGR4VkFseERxSmQr?=
 =?utf-8?B?aDRzck5pOUUzcHN4RGtEOTBvSkVoZzY4d0d1UFg4MzBxdVBOMDJSOTVKeHhR?=
 =?utf-8?B?d3ZOWS8xa1cyWUFGaCtOdjVoWDd3VjhzN0EybWx1SHlHZEVySGFickR4b1U4?=
 =?utf-8?Q?1WWFQ8VH48KGR3i4=3D?=
X-Exchange-RoutingPolicyChecked: zzvAWR7++0XnLA7nryS2dteJqNwNqBz6bu+4TA0Y/TXK0tKIR0YQBL24GjjIUwlT1rlAr+vMWH9Ogfun0KubOrwMZN4f6u72Cn2PcDmtwa2niwppMYTllLGp5WAm5kTdEkXgO2HkU2OGpq5Gzpyp5K+G4hqD+6m5CbTtZSklqa8aduebnC38KNezxWS2IXrEpV1koxDAkVpisZg8cPxTB0LGEv6BS0TeGYy7nMucBnpPkTk/9B7TvLVIxQiGMfl85cIGjvMGahzBovYfkEV/w/GuOgM5osa1hJN2duqu+Hqxw2ckYzrs+38pMwyh1JhmIEZUI8z9RtKIxIcznTFcIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: cd08a192-586a-4e09-58cf-08df0ced2496
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 14:34:37.1403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2abFqwpN+ixjDLQyaLZ0/wRF3nQu150SwBduLurmr+Rl5XysEaCoYVSh+Xs6oAqeZyVmqec++sZbbwR7B8KVmY2CX1pTF9cuANUfchHNl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
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

Hi Chaitanya,

On 8/27/2026 12:24 PM, Borah, Chaitanya Kumar wrote:
>
>
> On 8/26/2026 12:03 AM, Naladala Ramanaidu wrote:
>> Introduce a new helper library for Variable Refresh Rate (VRR).
>>
>> Add helpers to validate targeted refresh-rate testing.
>>
>> v2: Modify debugfs with helpers.
>> v3: Add helper to check cmrr support.
>>      Address review comments. (Mitul)
>> v4: Address below review comments.
>>      - Add source and rationale for standard timing refresh
>>        rates. (Chaitanya)
>>      - Restrict target RR debugfs helper to Intel devices. (Chaitanya)
>>      - Make Intel target RR debugfs helper return bool instead of
>>        asserting in the library. (Mitul)
>>      - Avoid assertions in library functions and return status
>>        instead. (karthik)
>>      - Reorder source list as per naming convention.
>>      - Rename cmrr_supported() to 
>> igt_vrr_target_refresh_rate_supported()
>>        for consistency. (Chaitanya)
>>      - Move CMRR-specific macros and enums from the library to the test
>>        file. (Chaitanya)
>>
>> Assisted-by: GitHub Copilot:Claude Opus 4.6
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   lib/igt_vrr.c   | 149 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_vrr.h   |  29 ++++++++++
>>   lib/meson.build |   1 +
>>   3 files changed, 179 insertions(+)
>>   create mode 100644 lib/igt_vrr.c
>>   create mode 100644 lib/igt_vrr.h
>>
>> diff --git a/lib/igt_vrr.c b/lib/igt_vrr.c
>> new file mode 100644
>> index 000000000..5b710b3cf
>> --- /dev/null
>> +++ b/lib/igt_vrr.c
>> @@ -0,0 +1,149 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <inttypes.h>
>> +
>> +#include "igt_vrr.h"
>> +#include "igt_sysfs.h"
>> +
>> +/**
>> + * Integer refresh rates that sinks advertise as standard video 
>> timings, and
>> + * for which a fractional (rate * 1000/1001) counterpart is also 
>> defined:
>> + *
>> + *  - 24, 25, 30, 50 and 60 Hz are the film and broadcast (PAL/NTSC) 
>> cadences
>> + *    carried over into the CTA-861 video formats.
>> + *  - 48, 96, 100, 120, 200 and 240 Hz are the integer multiples of 
>> those
>> + *    cadences, also listed as CTA-861 video formats.
>> + *  - 75, 90, 144, 165 and 180 Hz are VESA DMT/CVT and adaptive-sync 
>> panel
>> + *    rates in common use.
>> + *
>> + * The fractional variant of each entry (e.g. 60 -> 59.94) is what a 
>> target
>> + * refresh rate in video mode programs.
>> + */
>> +const uint32_t igt_vrr_standard_video_timing_fps[] = {
>> +    24, 25, 30, 48, 50, 60, 75, 90, 96, 100, 120, 144, 165, 180, 
>> 200, 240,
>> +};
>> +
>> +const size_t igt_vrr_standard_video_timing_fps_count =
>> +    ARRAY_SIZE(igt_vrr_standard_video_timing_fps);
>> +
>> +/**
>> + * igt_intel_target_rr_debugfs_write:
>
> Don't name these intel specific.
>
> Otherwise these won't belong in lib, right?
Sure. I will rename the debugfs name.
>
> For now just make the debugfs check intel specific.
> If other drivers want to have similar implementation they can add 
> their own debugfs.
>
> Also keep the debugfs check in igt_intel_target_rr_debugfs_read and 
> igt_vrr_intel_target_refresh_rate_supported
Sure. I will rename the debugfs names and i will add intel checks inside 
the debugfs.
>
>> + * @fd: DRM file descriptor.
>> + * @crtc_index: Index of the CRTC.
>> + * @numerator: Numerator of the target refresh rate fraction.
>> + * @denominator: Denominator of the target refresh rate fraction.
>> + *
>
> Use actual arg names.
Agree. I will update in the next revision.
>
>> + * Write the target refresh rate configuration to the per-CRTC
>> + * VRR debugfs interface. Passing 0/0 clears the target refresh
>> + * rate.
>> + *
>> + * Returns:
>> + * true if the target refresh rate was read successfully, false 
>> otherwise.
>
> written
I will address in the next revision.
>
>> + */
>> +bool
>> +igt_intel_target_rr_debugfs_write(int fd, int crtc_index,
>> +                  uint32_t rr_numerator,
>> +                  uint32_t rr_denominator)
>> +{
>> +    char buf[32];
>> +    int ret, dir, len;
>> +
>> +    if (!is_intel_device(fd)) {
>> +        igt_info("Not an Intel device\n");
>> +        return false;
>> +    }
>> +
>> +    len = snprintf(buf, sizeof(buf), "%u/%u", rr_numerator, 
>> rr_denominator);
>> +    if (len <= 0 || len >= (int)sizeof(buf))
>> +        return false;
>> +
>> +    dir = igt_debugfs_crtc_dir(fd, crtc_index);
>> +    if (dir < 0)
>> +        return false;
>> +
>> +    ret = igt_sysfs_write(dir, "intel_vrr_target_refresh_rate", buf, 
>> len);
>> +    close(dir);
>> +
>> +    return ret == len;
>> +}
>> +
>> +/**
>> + * igt_intel_target_rr_debugfs_read:
>> + * @fd: DRM file descriptor.
>> + * @crtc_index: Index of the CRTC.
>> + * @buf: Buffer to store the target refresh rate string.
>> + * @size: Size of @buf in bytes.
>> + *
>> + * Read the target refresh rate from the Intel per-CRTC VRR debugfs
>> + * interface. The returned string is always NUL-terminated on success.
>> + *
>> + * Return:
>> + * true if the target refresh rate was read successfully, false 
>> otherwise.
>> + */
>> +bool
>> +igt_intel_target_rr_debugfs_read(int fd, int crtc_index, char *buf, 
>> size_t size)
>> +{
>> +    int ret, dir;
>> +
>> +    if (!buf || !size)
>> +        return false;
>> +
>> +    dir = igt_debugfs_crtc_dir(fd, crtc_index);
>> +    if (dir < 0)
>> +        return false;
>> +
>> +    ret = igt_sysfs_read(dir, "intel_vrr_target_refresh_rate",
>> +                 buf, size - 1);
>> +    close(dir);
>> +
>> +    if (ret < 0)
>> +        return false;
>> +
>> +    buf[ret] = '\0';
>> +
>> +    return true;
>> +}
>> +
>> +/**
>> + * igt_vrr_mode_line_refresh_hz:
>> + * @mode: DRM display mode used for the calculation
>> + *
>> + * Compute the refresh rate directly from the mode timing parameters.
>> + *
>> + * Returns: Refresh rate in Hz as a floating-point value.
>> + */
>> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode)
>> +{
>> +    return (double)mode->clock * 1000.0 / ((double)mode->htotal * 
>> (double)mode->vtotal);
>> +}
>> +
>> +/**
>> + * igt_vrr_intel_target_refresh_rate_supported:
>> + * @fd: DRM device file descriptor.
>> + * @crtc_index: Index of the CRTC.
>> + *
>> + * Checks whether the intel_vrr_target_refresh_rate debugfs node is 
>> present
>> + * for the specified CRTC, indicating CMRR support.
>> + *
>> + * Returns: true if CMRR is supported, false otherwise.
>> + */
>> +bool igt_vrr_intel_target_refresh_rate_supported(int fd, int 
>> crtc_index)
>> +{
>> +    int dir;
>> +
>> +    dir = igt_debugfs_crtc_dir(fd, crtc_index);
>> +
>> +    if (dir < 0)
>> +        return false;
>> +
>> +    if (faccessat(dir, "intel_vrr_target_refresh_rate", F_OK, 0) == 
>> 0) {
>> +        close(dir);
>> +        return true;
>> +    }
>> +
>> +    close(dir);
>> +    return false;
>> +}
>> diff --git a/lib/igt_vrr.h b/lib/igt_vrr.h
>> new file mode 100644
>> index 000000000..d56639727
>> --- /dev/null
>> +++ b/lib/igt_vrr.h
>> @@ -0,0 +1,29 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef IGT_VRR_H
>> +#define IGT_VRR_H
>> +
>> +#include <stdbool.h>
>> +#include <stdint.h>
>> +#include "igt.h"
>> +#include "igt_kms.h"
>> +
>> +extern const uint32_t igt_vrr_standard_video_timing_fps[];
>> +extern const size_t igt_vrr_standard_video_timing_fps_count;
>> +
>> +bool
>> +igt_intel_target_rr_debugfs_write(int fd, int crtc_index,
>> +                  uint32_t rr_numerator,
>> +                  uint32_t rr_denominator);
>> +bool
>> +igt_intel_target_rr_debugfs_read(int fd, int crtc_index,
>> +                 char *buf, size_t size);
>> +
>> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode);
>> +
>> +bool igt_vrr_intel_target_refresh_rate_supported(int fd, int 
>> crtc_index);
>> +
>> +#endif
>> diff --git a/lib/meson.build b/lib/meson.build
>> index a7cde027e..b5aece55a 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -56,6 +56,7 @@ lib_sources = [
>>       'igt_vec.c',
>>       'igt_vgem.c',
>>       'igt_vkms.c',
>> +        'igt_vrr.c',
>>       'igt_x86.c',
>>       'instdone.c',
>>       'intel_allocator.c',
>
