Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D19FF495F
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 08:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5CE10E4FA;
	Mon, 30 Mar 2026 08:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KkNkooLk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3647C10E4FA
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 08:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774858733; x=1806394733;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U3F4Xlrm01d9Ji3mOSX3tn2Mlm3OJ//SINsb1Ct5Etc=;
 b=KkNkooLkKGNFQrjW95T41iqpnVFZeLSu37NQReJiqpywC52CcDsiKiDA
 lQbgoLboOlUAGU4bkcjhcA5IKPwMnqbUZY949/2TbibI1oOYPwuNGfEO4
 7p030Pzx1h18586zacLeUnArJ+sG5XvgWEk8zxNvvox6ovQYyFFXzs3jA
 PWh3HWu1cyU4vFFIF/coQTZz1L/NFhuLViwXMN1qFnccWzyXuTGcZOJ9K
 P+QTGyCP431urIOJ0jQnFAvEQSI0cKXJlykMmeD5aye4w67bwN2kJZypz
 FIlqxDm6UFouSIEZygwhGnkPiyx/AaJ5NSEGnVe12pek42gT9u+hcSfbF w==;
X-CSE-ConnectionGUID: X1+hDhx/Qn6yRtiMx3Pu7w==
X-CSE-MsgGUID: uMAKYJAvTkCZMFR1riKt8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="63396916"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="63396916"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 01:18:53 -0700
X-CSE-ConnectionGUID: +GAebjLZSoeFZ0evcXKO4A==
X-CSE-MsgGUID: Th1yHDPnQtaUj6rBClRvhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="230899234"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 01:18:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 01:18:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 01:18:51 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 01:18:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WvnkXHMe6UgT4mrACtReBx+yZTAzrNZyCAbY27aEb14iyWruXm2lQuLUsMS/W1BEEWO4Y1ObZHs4We1kGwekEmpGZGYPdw/TjlKRC37taGBXYWKDBxsNcdw74ocWCyjnnZyXVndWKx2cseaRpdsoYnae7AD9NfwSRiKb/iCMVTG/8Sv/bVujcjOiIRv8pM5jRzX45Qplcg20anhJ38hX3OVhyb0BPAmgCTkuma91csQv2lgBkpXOPqywhPYSxtPKIlNOQMoXFflmXv+LsdNmAGHMrsxQYRC1G9lWO+eCpLKQeBmbkcusqHM5bM+7JFBiP56XthWvTMDuMCHiINmppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAJM5PtOge8gw8q4lcZFd+nw4T5Q+CFcR2lNhwxkZKg=;
 b=ZU5Zi/Mqvwmy2qsIvHbScQ+5lgA5pDHKTZXwXZngSp+J6VmSmjKv646TVu/cM2qHuv5faMtk9vktBBLH2LXsm4oD8DB0267ZA0MZGrevyPpnrB6+2TkRjnkUioryZDWRpP/ov1ni8Buo3+KYIhjzzLIPoJnIGppp3/l5sQdDPmWk2ibdgxWC/nk5/LpYGTeoq8anbd5XGt4fLW1Irm+eszCVQ7W7+OdRbM8pkbZAjtMA1o0TBm1YNBiwv0HfdLgi7+KqudR6MHsaUBP0ujkmAv2RlJnsAdwjgDcx5SUcrEvzn6V0bnLqnJhoeIwbSK0pw1RoW5gMEQCaN7wGTqNzUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 08:18:49 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 08:18:49 +0000
Message-ID: <8bb8baf4-e291-4c48-940b-13a1339d17f8@intel.com>
Date: Mon, 30 Mar 2026 10:18:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 2/4] tests/intel/xe_sriov_vfio: Add dynamic
 bind-unbind-vfs subtest
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <adam.miszczak@linux.intel.com>,
 <jakub1.kolakowski@intel.com>
References: <20260327140627.64574-1-marcin.bernatowicz@linux.intel.com>
 <20260327140627.64574-3-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260327140627.64574-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0372.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::14) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|SA2PR11MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: a7864e29-1558-48e7-921a-08de8e34f892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: RumnCtHU+dbTR9EWAc+SduA70w3uvETkMMQWjjhtFPMbGPM4q5ksMjDlFfEzb8xfOp2E7iMNAU1AdpIQ+nBHBjxr7mek2pQ4UpUU0br0TvVvNEqF46pP+hZWask6Vy1yjhJFSnnR3Jre1TBaXft1WsJXL1QPwC8qxWOQdVtQ1+KX/Hm4DcrjNkYZCwkOxKXlNeg7Fu4YATRQAjqiW8ogYvJgZCwXF0ar3rvgEE+acPNDl7mNP2CWoSkZ062l6DnpfdT3vejAm/fLTGFEhMN13daNQuecFIar0MyaF30K6cbjHGzHYyYdsL+9eB+x/VfLnCEuZPhVmYsF6RrxjfQEU5u3mGedd0cFQ43XLWz07LGTl1uGBu5ShcYzI4JmvZtBVBojOqChME5ljR6LfDHpg/IcVaXzZrcilD5poUwzkM2dcDMFsw+TmCSF3xUOtw1fEfop6L+AlVS+jCdr6TJo9zZ+phbj5+jWa/1jYajjyqaoQipUl31YSj0LKvbOW/C6eo5FKN5kqqZKIL9akro0XrOdYIxzv1gLqV3+0xiW3LrQpRbFBaO6bIsr2ctS52A79G1MlOCIkc8Nqib/OM5CCl+1/aI4Aa6qJAySJbR0Qv8eEaKU59QWOlNsapp7DsxzbFQb0uV9TjtUqCkJvweUiFKHiSQTP67/duEckAUpxtose1HZsTaP6zJ21SOTwWM5CYNLvMChb6dMCNtPW/+eS/JoZ6Uv9yoApTXMMnvpZJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHY2RTZxNGtIUENjcy9EV1hXNDlwbkc5eGFlQzVJOER3MFBPVEp1SWRJV3p5?=
 =?utf-8?B?WFpTOWlsclpYWW9KeENENHczeld3MmFqRE5reVVCcHNmdGdKZG51ZzJqQStK?=
 =?utf-8?B?dldLcUFWNGRRYzVVUk5RcWZicE5kUnBnVzl0NjY5MjdmNmtnUGdKNnVOT2U4?=
 =?utf-8?B?L3hVN3hCUUJVbVl3S3duVXpzWVdJNHA0bHA2Z25Yc29iVkpWVWE2SmI3UHpn?=
 =?utf-8?B?aHdrU29TSlQvQVV1VC83ajl6REdHcFZRbDllY3F2dWdubTJNMk85QXR1bmNx?=
 =?utf-8?B?Ny8rdWFKNDU2UWZjK2xQYmNBK3F0ZTdQYVRSZEhuUTJYc04wdXdDUjM3Kzdh?=
 =?utf-8?B?YkdXeE4raW9qRkVFUUY0WFduNHRNWGZlOFlXR3AwYnJXdnZSR3BvYytKd1JQ?=
 =?utf-8?B?WExEZDNUdEhrOEg3cFFVV0s2V24rb1hBcFEzS3NWYUJtZjRiRXVmRzdyMTZE?=
 =?utf-8?B?R0NsUWJvK2g1NlRTdWdjQVpwYkQ1blBlcmt5eEpRQkt0Z3RUZDJqVDdTQUpK?=
 =?utf-8?B?UTF5bzNSNU16QVRxeS9UMGo2dnFEcjdENjJNMXRtWElkOWpKcmZwSFlKSHYv?=
 =?utf-8?B?dFlwRnpaeXdWS2ZuTnczbHZ5Y0NDdXlUNndLRDdXekN3c1F4N2w0NzNXU3lH?=
 =?utf-8?B?d1pZREM1SjNhdUcvWWkwQzRjdXdNeWlsNnJEU1Bmekh2MjBjNGpiVXRoZjZF?=
 =?utf-8?B?ZFZSUmhZMFBVRVZJbER0b2ZhUHVXdzliSTJaUURZZVJuZHRSNUJrRnFDaHpN?=
 =?utf-8?B?b0JZcUZkd1FzSFpQVXVpbWJxdXhyenBwQXFzZXdKU1hOc2dxc1FYSW82eG9q?=
 =?utf-8?B?QzAyRUZsNFBmeHhya3dJaHd4dmNJQzk4YnhnSnRhQmYwdTl0UXhTSERVSXl6?=
 =?utf-8?B?S0NROWxJNFk4L1dNYWsvZXRpc3BzdVI0VFJ2SUdmTTlaVmU3a3UyTC80V0ps?=
 =?utf-8?B?ZGNDa242R2tDM3FHaGp5ajhkOURPeVlVbjZlY3F0WW5tZXUzL29ISldXZ3dC?=
 =?utf-8?B?S0Qxb01xcjNia3FwRXg2Zk5MYXF5R1Zaekw2UmpQZCs3L1RnUVdPa1RGelRo?=
 =?utf-8?B?QTA3SmJCTzZPdEo5UkJva0d2MHRRK2FDT1J0eVc0QmhyNjFNaHdKUzEyMXlZ?=
 =?utf-8?B?UjVxYWdPWFFpZDUwMTJDNkpIOVJMMS9oZE5Iek1rVlBZZEZHZFVpM2FUY1NK?=
 =?utf-8?B?TXlITDZnZStwKzgvZFZTanA1R1lTalE2R3pMdkV4QmUrSmFaMDI2ZldkSE1D?=
 =?utf-8?B?Wi85b2dkRHpwaHdORWM1eUoweEtZMVA0NytWMmJYNHpnQ2N4OC9CaEZEM0Rx?=
 =?utf-8?B?bkRGa25lWk9JQ1kvNXFnVTZwN05JcUtPdjN0SSsxUzVqZzl3eFZOYXoxOE9Z?=
 =?utf-8?B?U2tYeU9aL1dkcG1LQnhhNndmVTQ2aEVPaU1yZFhMRllDU2t2S2tLR3hxT1pZ?=
 =?utf-8?B?Zk8vVlhsekNRZXR0OWp3NXJUdyt4clZDWG85SHBhUUZmYzROVWYvQ251anZZ?=
 =?utf-8?B?OFo3Yks2RjhRQzlJeStmSllFUHd2K2Mwdy9iVkc4S2RxMXM4YitzQ0NacDlD?=
 =?utf-8?B?bXp5eVYyL1BDUGlRaXhpck41MGVmQndkTkZqZ281ck1FaGlrcHNyQ2hWVGEr?=
 =?utf-8?B?Q3ZJc1VZQ2hKMkl2eFVjSDFIYXN6V1JMYy9qQzRtcFUwRG91aVczMFVTbzd4?=
 =?utf-8?B?Rnd1VktJNnNBNjloRDFIVnhpd2V0TnQ0THhwaGFaa25mV3l3WTRwVUtPYXNQ?=
 =?utf-8?B?NlVlekpxNFlUYWlJL1FMTzJINE96T3hTdm9XSDgybmxsR1Zvd1FqdVl0NXFG?=
 =?utf-8?B?bmdUKzFOaWlsN1h1Q2ZXWndtQ1M0MzRNdHNrM3lYR3lLdllMck05L3dhdmU4?=
 =?utf-8?B?Vk1Va1lVcUhyTFQ1MFZjMmUyaTZvTDlGZDBDVkhrVDdWeHZQbGZWZk9zZzJ4?=
 =?utf-8?B?VjVodkhTS0xwU2xjVzk4UUhMSHpZLzE3TEJ1TzN6bWJnSFc2SitXK3MxK3pt?=
 =?utf-8?B?R0wzemN5U0J0SVpxVUVGcVFFWXE3dUZPSEZOSm5XWE9OM2czQWloREY5ZW1V?=
 =?utf-8?B?M1E4SUVmbWkybXVPdTRkQUJFYm5qMFZONkErcHA3cjlGemJQUzJDVXd0VjQy?=
 =?utf-8?B?ekw3QmdXT1VFUzRBb1lHL1NDMkduMG5la1JpU3F2UnNzWG1JRnpaTXdEOENu?=
 =?utf-8?B?SXVObjVacXFoZGQyQlRweXRYSmt4Y1hsSk9zWHExQkIza01jTWpJQWZMYjFG?=
 =?utf-8?B?dUc2MnJJYzRFbWZHcEVjVU1MaDdnZFVZTmZxUmJzaXNpS0JTeG1ZUWJPQzZI?=
 =?utf-8?B?S1A1R2NJTWdGN25SaU42WjcwN3lvcy9NNk9MRi9KWTZtY2I0T2tpZz09?=
X-Exchange-RoutingPolicyChecked: k86hOKFVKz68Ek7YwCfcPTXRTetGz/rW+jPaTrdbW7/z/cjiXMbK/meXAkLSiQu1mSuUYPaqmlF49dsTUyyVT5xHv7I4H2vA0C01RVK5odRttoVMUk9nWeWxeO2ZevdM+tvtDOZNeu1245EbPbV24PVS3b7sMvdkpPB3TRr+d9+eTx8irIs9YWrzaXeWJ2iNKycQ21l1bv1/6v6/Facb87WTLLLe65wJk3A1jJXeqPKM3rKsPsRJtlOYJ+aciuziTpPxlbVvlflgO/bMKLGDw7cFcrIttDwMs/cgkVSUuvWPX3rPnuEt21Nz8GELttUeL7lWfWLyeCmVRxu83MVP2Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: a7864e29-1558-48e7-921a-08de8e34f892
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 08:18:49.4110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /H4Ae1ZJRA4tyswBg/iCf08uPR2McZmUo4boi6cPRzXBWahrpv1RqtTIk7OFEszcmZG0JjqjRQLDdsUJHstS2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
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


On 3/27/2026 15:06, Marcin Bernatowicz wrote:
> For each supported numvfs-N configuration, enable N VFs and
> bind/unbind each VF to xe-vfio-pci through driver_override.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
> v2:
> - Split assert_bound_driver_is into two helpers (Lukasz)
> - Remove unnecessary unbind before bind (Lukasz)
> ---
>   tests/intel/xe_sriov_vfio.c | 139 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 139 insertions(+)
>
> diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
> index ef92fb233..fa9026741 100644
> --- a/tests/intel/xe_sriov_vfio.c
> +++ b/tests/intel/xe_sriov_vfio.c
> @@ -3,8 +3,11 @@
>    * Copyright(c) 2026 Intel Corporation. All rights reserved.
>    */
>   
> +#include "drmtest.h"
>   #include "igt_core.h"
>   #include "igt_kmod.h"
> +#include "igt_pci.h"
> +#include "igt_sriov_device.h"
>   
>   /**
>    * TEST: xe_sriov_vfio
> @@ -16,14 +19,135 @@
>    *
>    * SUBTEST: load-unload-xe-vfio-pci
>    * Description: Attempt to load xe_vfio_pci module and then unload it.
> + *
> + * SUBTEST: bind-unbind-vfs
> + * Description: Enable VFs and bind/unbind each one to xe-vfio-pci via driver_override.
>    */
>   
>   IGT_TEST_DESCRIPTION("Xe SR-IOV VFIO tests (xe-vfio-pci)");
>   
> +#define DRIVER_OVERRIDE_TIMEOUT_MS 200
> +
>   static const char *XE_VFIO_PCI_MOD = "xe_vfio_pci";
> +static const char *XE_VFIO_PCI_DRV = "xe-vfio-pci";
>   
> +static int pf_fd = -1;
> +static bool autoprobe;
>   static bool xe_vfio_loaded_initially;
>   
> +static void assert_xe_vfio_pci_is_bound(const char *pci_slot)
> +{
> +	char bound[64];
> +	int ret;
> +
> +	ret = igt_pci_get_bound_driver_name(pci_slot, bound, sizeof(bound));
> +	igt_assert_f(ret >= 0, "Failed to read bound driver for %s (%d)\n", pci_slot, ret);
> +	igt_assert_f(ret > 0, "Expected %s to be bound to %s, but it is unbound\n",
> +		     pci_slot, XE_VFIO_PCI_DRV);
> +	igt_assert_f(!strcmp(bound, XE_VFIO_PCI_DRV),
> +		     "Expected %s to be bound to %s, got %s\n",
> +		     pci_slot, XE_VFIO_PCI_DRV, bound);
> +}
> +
> +static void assert_driver_unbound(const char *pci_slot)
> +{
> +	char bound[64];
> +	int ret;
> +
> +	ret = igt_pci_get_bound_driver_name(pci_slot, bound, sizeof(bound));
> +	igt_assert_f(ret >= 0, "Failed to read bound driver for %s (%d)\n", pci_slot, ret);
> +	igt_assert_f(ret == 0, "Expected %s to be unbound, but is bound to %s\n",
> +		     pci_slot, bound);
> +}
> +
> +static char *vf_pci_slot_alloc(unsigned int vf_id)
> +{
> +	char *slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, vf_id);
> +
> +	igt_assert_f(slot, "Failed to get VF%u PCI slot\n", vf_id);
> +	return slot;
> +}
> +
> +static void vf_bind_override(unsigned int vf_id, const char *driver)
> +{
> +	char *slot = vf_pci_slot_alloc(vf_id);
> +	int ret;
> +
> +	ret = igt_pci_bind_driver_override(slot, driver, DRIVER_OVERRIDE_TIMEOUT_MS);
> +	igt_assert_f(ret == 0, "bind %s (VF%u) to %s failed (%d)\n", slot, vf_id, driver, ret);
> +	assert_xe_vfio_pci_is_bound(slot);
> +
> +	free(slot);
> +}
> +
> +static void vf_unbind_override(unsigned int vf_id)
> +{
> +	char *slot = vf_pci_slot_alloc(vf_id);
> +	int ret;
> +
> +	ret = igt_pci_unbind_driver_override(slot, DRIVER_OVERRIDE_TIMEOUT_MS);
> +	igt_assert_f(ret == 0, "unbind %s (VF%u) failed (%d)\n", slot, vf_id, ret);
> +	assert_driver_unbound(slot);
> +
> +	free(slot);
> +}
> +
> +static void bind_unbind_vfs(unsigned int num_vfs)
> +{
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +
> +	igt_require_f(!igt_pci_system_reinit(), "Failed to refresh PCI state\n");
> +
> +	igt_sriov_enable_driver_autoprobe(pf_fd);
> +
> +	for (unsigned int vf_id = 1; vf_id <= num_vfs; vf_id++) {
> +		vf_bind_override(vf_id, XE_VFIO_PCI_DRV);
> +		vf_unbind_override(vf_id);
> +	}
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +}
> +
> +static void open_pf(void)
> +{
> +	int fd;
> +
> +	if (pf_fd >= 0)
> +		return;
> +
> +	fd = drm_open_driver(DRIVER_XE);
> +	igt_assert_fd(fd);
> +
> +	if (!igt_sriov_is_pf(fd)) {
> +		drm_close_driver(fd);
> +		igt_skip("Xe device is not an SR-IOV PF\n");
> +	}
> +
> +	if (igt_sriov_get_enabled_vfs(fd) != 0) {
> +		drm_close_driver(fd);
> +		igt_skip("VFs must be disabled before running this test\n");
> +	}
> +
> +	autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
> +	pf_fd = fd;
> +}
> +
> +static void cleanup_pf(void)
> +{
> +	if (pf_fd < 0)
> +		return;
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +	igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)\n");
> +	autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
> +		   igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
> +		       "Failed to restore sriov_drivers_autoprobe value\n");
> +	drm_close_driver(pf_fd);
> +	pf_fd = -1;
> +}
> +
>   static void restore_xe_vfio_module(void)
>   {
>   	bool loaded;
> @@ -69,7 +193,22 @@ int igt_main()
>   		igt_assert(igt_kmod_is_loaded(XE_VFIO_PCI_MOD) == false);
>   	}
>   
> +	igt_describe("Enable VFs and bind/unbind each one to xe-vfio-pci via driver_override.");
> +	igt_subtest_with_dynamic("bind-unbind-vfs") {
> +		igt_skip_on_f(igt_kmod_load(XE_VFIO_PCI_MOD, NULL),
> +			      "Failed to load %s\n", XE_VFIO_PCI_MOD);
> +
> +		open_pf();
> +
> +		for_each_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-%u", num_vfs) {
> +				bind_unbind_vfs(num_vfs);
> +			}
> +		}
> +	}
> +
>   	igt_fixture() {
> +		cleanup_pf();
>   		restore_xe_vfio_module();
>   	}
>   }
