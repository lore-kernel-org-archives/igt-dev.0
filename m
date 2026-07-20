Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E05FC44520
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 11:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36AF10E8B1;
	Mon, 20 Jul 2026 11:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AgR3qyjW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BA810E8BD
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784546946; x=1816082946;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=ykWipOzDZY7l48WzQEAISknploV4C7HdGByppN7VmHY=;
 b=AgR3qyjWgi2gmBUqCIcBHih6Z9ma0Gx1SgOeeUJB2u7lI2pQX+qgxPWJ
 5YJUVntUodomdi3OgxILq45XmGN/56dGsZuBVSW7weStyCNQe8KaYHLQj
 Qe0FAnS+j3SPfwBNHdPCmPAlqZZuKqV9iNb0MG1aANujwQ7SwNvGgvbG5
 wQbJIcGi7ebQgM57Nl6DqIqWFjDwg1Svl3UJTRpjldg8wWAUlJgoKtlWK
 VQkC0pu3PCk1Ij5AqEs/hrnM4MriNJsu2bZqLMS7tMTl+weLQOQ1VbH3r
 ml7VUYraW1Ii+FEEmbgCFeNqanCxGDQbGw5o/5sJlfXqmzxRx6FHsr3lp Q==;
X-CSE-ConnectionGUID: C4zZGZsdQL2OWepsLDCR6Q==
X-CSE-MsgGUID: VMaYE2f7RzKhXaciJSLbig==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="85242645"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="85242645"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 04:29:05 -0700
X-CSE-ConnectionGUID: BnNReD9kSLGmm88rgoVuPQ==
X-CSE-MsgGUID: IWfykv42Qq+eVBZ0+1XOoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="251089052"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 04:29:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 04:29:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 04:29:05 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 04:29:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cl19usCrmkHrlGJEHmzQTJ+Gp0V2608OnKSuj+ieMur0u4+j4dL7d4b5OjU7PGrrpJhlmPDKch8K9eIjLhrZgWzqNPIfYZNd5M2MzU4N0rDvjgndXnLDaZe8Hf2zGRToreO2Sy/x2JREGe13TsKWIKrpFvS10n9EcXamRtOR2RRpc58ISxf1ibjY22wm7q36lbZELqErw3gIlm+UhhSsmis9TxAJeyt+C7jfvavgqH/E1OHAmGB4Po9kBzLN3P/yOho3cn9gwwhluR2iwbFFwXr+d83Z75iXMn8x6CfO3eXRqQxHkjI3kVH9BpGJ9WUYtHr4ZfwuRFUOFO/HMLev9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zcghjbmVqDEK/NT1cTN6NngPMvkzv2vOc3AksuJfik=;
 b=T2fdg7RzVB78ROEMOfqofru6bezhK5l28fqa80ricEMAyIpi1SzIWxe1Xmx3uiuVtMyw+Wkh0A/2kqHeKghhReBz8f3LsxH0KH6lr/m5CD4RkerGvmA4VGxekhWuE1YeBagniF4rxa6mnHv4Tci+o42cM2gnr6tuPLi6MOTkB4Msn3nhzbong2WDRnhBRRebTNCtJw3XMPLEv1wsa5o0Tr9wE+E7r7a+3WDrvWmI+oemVVHOp15q3OLtqpckGYJvK0UeJKcsucIiUFtdFnlBxkrFdjvwMbepSv7Cxym95CgKYHTbr0pJFqhacHD2IMbi4syYGdGliD/8ZeCYUkbJpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 11:29:02 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 11:29:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 20 Jul 2026 13:30:04 +0200
Message-ID: <DK3D4887RI7E.HX0EF2D4CLAO@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Mark Yacoub <markyacoub@google.com>, "Ashutosh
 Dixit" <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 30/31] lib/igt_core: move igt_load_igtrc to
 igt_device_scan
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.21.0
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <db4400f05ba72613df363cc62496319a5c0fed9b.1784117512.git.sebastian.brzezinka@intel.com>
 <20260716140853.66ulgagvtzvp5mkh@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260716140853.66ulgagvtzvp5mkh@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: DB9PR06CA0030.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::35) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MW3PR11MB4748:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c48dc93-d200-45c2-7742-08dee6521969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 89BybO080jWYN0N1SMfs2p4XU1oV4u8qhBe1Bm0lPWYH1yOijwVkoOmKwOg8NyN6Gxa604m9wKkU+kdh5Adh+I+5GWfmQQACNfBlZo6BI/pgtsl2IXiGqf2LX9CmsgjjfgXUwbNt9/CKMfQU7a7n5PqSKrKpD53oc021Y5jCbHSVolpiov+fHrySQO8Z+9GM7+s2cPmbH4WBkNoDcRJ7qqXjry9b/HdVW1ERBuKqa5p5vg83WQxRCwsrShEpvczJk7EQ3inr6Avgqh1TGamOHvVXR77nPFOZ6LEC/YqbV6pXQDBHkNw6/HrLuS9CPea9BLe2fjjM8VGBczyTTgobqbDyn2/97nuznCsmM1hwIojnai+7lER63ysa4Bd/yXtr4z278WpaFQImE8KoNcT1pSg9M4/GrLrOU0mOzrrt3RnLAHXp9+t/cjU+AQbTek9cg+QiHjlQgdPfoTFTrUIpDT8bk41lFMBtqd2iW/D2I0ilg3KF9vfG5n//kiIDPF9KmXGzg339nVBKrktJi7ztnhvvN2B7pL8ExcF4OlAJpfOiTJnJZ7OAVjZE50mbmqtw/SJ8m0nEsLn8Sp64gtjXXjkSUwpvj3uvEwXZOt0D3wovbaLXpNd0ECHTXDLOyEf9oyWmuPwb3QVTooBVdeTgvZwmQF/f+Mei9iBMFzP9b/4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTVSZ2lmNDdXR2Y3WUUxbmFVVnoxeFBpVFBOS1ZyNWVqdWEzcGFTZENRblNG?=
 =?utf-8?B?Z3U5ZW1xVDdUb3FmblMvNklRREdUaC9MR0VKQjhDbk4ySGRydzRrdDRwbFlq?=
 =?utf-8?B?bDlhdUJjYVlJRzZSVGloQzFiWUsrNm1uNk40QXpUSExoZVRjTHBxZ3F5Ujd1?=
 =?utf-8?B?RUVISjYxVDBNeDN2QWhpcEU0R3ZNbVFqOHNoOGVxbFVRbFpNMVBsY3pua3di?=
 =?utf-8?B?QVphK1lTSWVoTlBOVTN1OStLQk1LWDlqSUJ1RklpcWZFMC9yRUtjd0dLa0FM?=
 =?utf-8?B?bTFWYU1TcCtmUTZHUWoyK0NiTGUwcW5VSm5adzdnTW9KcThlV1Y2YU1sYm1t?=
 =?utf-8?B?aEU2emQ5OHM1L01BcjVRVW9oT3drZU1iMFRGOFBreXZRbXJ0VHhrSEIrdFo2?=
 =?utf-8?B?WkswYU1IMDFqb0JxQ1JHczUrMzFtMUV6N01qclo5Vm81dkFibU1hdnl1Yllx?=
 =?utf-8?B?WDYyMnRRMEN1NG11MzhuM2VQMUxSaVFjeU1xeXRUZVVYd1FsVjdHZmF2WW1I?=
 =?utf-8?B?cEtuN1cveExpUkdzN091QmZEMUxNencydEE3UElMc2xNMDNoRHVxdXMwM3N0?=
 =?utf-8?B?UGV4VDhqWkMwcmFrck1HS0RSeHJsK3poNkhHRThVUzJMdllNemYxZjFjc1cz?=
 =?utf-8?B?UlhNejNpSFNHTTFlMGhHZEZpKzlTMWtDaTFyMk1HcDlJS1BCbHkrRE9aclov?=
 =?utf-8?B?bXJXc0gyUjUybFNOL04xQXBIOEY3MElnVUtkdTlaQ291aWRaWTE1R2FBVjIw?=
 =?utf-8?B?emhHclhTakJXUFRXTjIyZ2wybVIwN2JaY2hXK3NVUC91NTNSa2pVWk9hbnJy?=
 =?utf-8?B?NGtHT0lyTWRId1NZWWtqVE5YOC9INGFRN3c1RXVQVFFUTHhFQS9kSXpWcVJK?=
 =?utf-8?B?VGZ2SDg2cWNVa2tPV0xTbytDZGhJWlpKVkg1OWV6T09UVDFOSTloeXVJWVZX?=
 =?utf-8?B?OUhzOVpFRE5FM1BNMEZYWlNIcnF4UHBsZWpFdW94aDkwRktPc2QzcUpqZVhG?=
 =?utf-8?B?YlppOGc5Yk9rWHJ5ZlZDYy9oNDE4bno4Wll6NFZiUWF1cktyUWRjd1hlQzNS?=
 =?utf-8?B?Z1JiLzRwTUxpR1gxZWVZb24vb1JrT0pYV2xhVzBZUkhkZWZUK3JNbENtTHNC?=
 =?utf-8?B?eTRaVHZVTW52Y1YwZmVEbklxUE1iYitScnNvYUVFME9vWE00VW9sQ0NnbENh?=
 =?utf-8?B?b0dZSDRZTmNEaW9jRlo2NUU3RlVCRCtGYTJQR0xrN1NXUzNrR25pSjVyeXNE?=
 =?utf-8?B?bmFUc2h5L1Eyd1hWa21jVVcwclIxNlVYLzBjSUd6V1NlYms5SmZYTllqZGxw?=
 =?utf-8?B?VTZRei8vY3FtVjhMaWw1OFN5UzJ3K1lSL2NBemlBS2tyQ2EvNUl1TUQwRHFa?=
 =?utf-8?B?dm5GTjF0ZXVwS1lzcTVwSmdOMHRaMHorWDVpUXc4SkE5citIakE4bXYyb0hI?=
 =?utf-8?B?SkNuSmZVRU4wTWtRSU5RbU04VFNMekU1Y2JCMU5kYTBuOE1xZUl3Z1JlOVNG?=
 =?utf-8?B?dnhnZDJaazQwRko0YkIyMEozbnY0RlY3ME9RQnc3a2JnTE14Lzk3V3hkM1g3?=
 =?utf-8?B?WDJrN0UvVUJ6WkFDWmtUbGhZTE5tQ0ljZFMvRXNjbUxDamxwdjFyam9CZWZm?=
 =?utf-8?B?VWVXSkpXQjFzd1ltMGpvTFl1ejdKclFyOWNmYUU3aWFhSVBPcnJkUk9OVzY5?=
 =?utf-8?B?TzMyaHFBYVd2Ykg2Qjl5NlBVbzJkVEh5MGJ2RU1YRWttRWRoeVE5Y2lKN3lV?=
 =?utf-8?B?aTVKUEZwMkhXUWlCdVN6dTBYOTFJOW1DcG9ScDE0dnFhR3g2aGZqQWx5c3px?=
 =?utf-8?B?aVBJRFBveVMzOExHSkdoUzM3THhjMktRVjRkejZWb1BGY3dKTWRlY21rWVZT?=
 =?utf-8?B?S05YYTFmcWFtTlM1b3JGUVRocDV6NXk5QStUckl6dG0wWFVPcXhsS1NCNy8x?=
 =?utf-8?B?OXRiVndTVmZWbWlxMUM5YTA3RUFybDU4d1l0SUVNR1QrMzl1bzFIVlN3Vkpa?=
 =?utf-8?B?YVRyNXk5RnZQL21vaWNlbXJwTnZTK05WVUtvQ3VzZmQyUFFiOXRSWFNtK1Er?=
 =?utf-8?B?QUQyRGY3Y0NocTlaNVVXN2tFLzhLZ3Q3TU96UEJMZElWV2RkUThLZzVqUmM5?=
 =?utf-8?B?MGk3ZkM4dHg2TThyZkJvV3h2bmlOOC9EbjhQaVF2bEQxRjQwMU50djZ5Y1JK?=
 =?utf-8?B?NlZSVXVkbEx1eHdTOFdvYXRhM0RGTklpQjRoM2o4NXUwQ0FDWkZQbDByaWpH?=
 =?utf-8?B?WWlLcUlQQTUrQmd2bWpPWHZSWU1PQ3dPdnQ4Q1JNbzB1NDl4OE80VEFZQ2pI?=
 =?utf-8?B?cFBmOTdSeDVvZ1VjcGFjb2tZQlJJM3Niazg1UUxFMnZSaW0yMXV3Z2ZEcXVH?=
 =?utf-8?Q?9id0BvPqhNM3c0sw=3D?=
X-Exchange-RoutingPolicyChecked: StArljwoa+UEYfMkPfQVrzlI+3lCEVhsFdB2odOWncz2uy30vyKO5+mQxoC9U6QsE2mwGE5ZqgUJVE0FFVZ5rHDp5oWcFBxalfyRVLBlhrUDL2k/S4byEMLwe12ZUFC21QhISa/OQNqCFxTXXuS7dKubdgiSj1lebe+07RvFdtrS3VU8r4tNDsUESeH1x20O7ojiDv9riQ5dqzS50j0G6D3JiSWOyk7CamJfzLOW4hnmCTNW83mrVJg7HbIGsDUH91yD3Ou6D0XHdQV31TjGVmWEajrxVQp8C1bDEBJwtkygpzAcGPc0KC0YPuihei2xttlo68Hn23qqd5me4qgu4g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c48dc93-d200-45c2-7742-08dee6521969
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 11:29:02.2871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsWk/tEO7YoZeuiW0m8iVIBs81wDkcyJqtops3AnI61tVJsY/q5wyjj7/Pi7tcTs91xiuQenWRemVj/Q7yf1TtFjPK5/XU9e+vypaG/G8iY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4748
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

Hi Kamil,

On Thu Jul 16, 2026 at 4:08 PM CEST, Kamil Konieczny wrote:
> Hi Sebastian,
> On 2026-07-15 at 14:15:40 +0200, Sebastian Brzezinka wrote:
>> igt_load_igtrc() is used exclusively by igt_device_scan internals to rea=
d
>> per-device configuration from the igtrc file.  Moving it from igt_core.c
>> to igt_device_scan.c co-locates the function with its primary user and
>> makes it possible for lsgpu to link against lib_igt_device_scan without
>> needing the rest of libigt.
>>=20
>> Update the declaration accordingly: remove from igt_core.h and add to
>> igt_device_scan.h where the implementation now lives.
>>=20
>> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
>> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> ---
>>  lib/igt_core.c        | 47 ------------------------------------------
>>  lib/igt_core.h        |  2 --
>>  lib/igt_device_scan.c | 48 +++++++++++++++++++++++++++++++++++++++++++
>>  lib/igt_device_scan.h |  2 ++
>>  runner/executor.c     |  1 +
>
> If this is used by igt_runner, maybe more proper solution
> would be to move it to separate lib/igt_igtrc.[c|h]?
Somehow, I don't like the idea of a file that holds a single function.

--=20
Best regards,
Sebastian

