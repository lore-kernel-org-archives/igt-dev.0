Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EEAFC72CA
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 07:42:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF8810E3F9;
	Mon, 23 Mar 2026 07:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1PgaQ54";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB8C10E3F9
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 07:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774251741; x=1805787741;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ANYc8W9ynzn5SHTBYSA2H0Yvtg3Es9Eb42GuVbsUVLE=;
 b=U1PgaQ54/h5v5zyThnP1KoLLarM6xAkwQYLhSHcZpnivzIj13LE2LgNP
 k67eaX27pLBuSdydxiuNrfPLjBYzy5lfX+fvhM7ON6uUW0VNF6AIdWz+F
 pLuQe4JB+jnYORdy+8Y72CSVjSIlBZbBFaD4xR2kUuNKhv1I8nevriGME
 WKBxcQZA65iNh9ezDFy3YIdezTp10TgJlnNbbeNkCUe6nNvVAlWXF31hL
 tJFfMPc1IAiY3uHNrfLGP9sFtxQi03lcBqL4wBdL8umYZ9MYarGmhYvCP
 aIR4sCqBhmz0Za4LwJAMWAmkpEnhdOGFShiW4RHdeTNYdwLHHIKqIy6j7 A==;
X-CSE-ConnectionGUID: HYZSAgqoQ6qBFQ0A//bcGg==
X-CSE-MsgGUID: 4otKcJsDTEWI3H60PW44Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="85868316"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="85868316"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 00:42:21 -0700
X-CSE-ConnectionGUID: 6OJ9706nS/mVoUDZUDk0Qw==
X-CSE-MsgGUID: Agac9bqjRp6YiGvnkWTihw==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 00:42:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 00:42:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 00:42:20 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 00:42:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVYVZSdGq03GudSzgzK+mf/06nT3vHVWaRGrL+1OCJr/OyCy8RqSl1zk4WV9v57xWtrD+Ni4I4A5QDZGv9Tq1UG3/KK5gVZxzrA+dRPNI0WLf8SqQ3B9L7FL7Jnd7pgvKAWzo2jP7E0GKWe4ROElT5lSPXjPFfq/+GDpivxzBn3CN02V46Ej8xQ+CnDY5C5w3pRnfEr+QYLrZ1huiuOyfVIisDc9vupEz2rp0Q9TQLDj0ZxSPj9WkZmBunrrH6cAMnKfGge0nCKe1LS6Qkuh9qPYF1k7S0cJ12AW47yG8sUIjfWbpvCsSEaIRwAdWdRuVjPtI9Uatb4RUvwWo0SmAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOKG3XqDYlqaiT//JIVkusACu/r7RNHikFsIaEiOtBk=;
 b=dkZXEKtyMd1+BnPparNqs+wuk9LXE/3sJpyitOOH+qC2siitLjybJi9q01WApvAncT8k9zuVXS+CHiYsHitk3uDLtwlufq/KIJBRmJKSfs+dJahlqcu3E8adnC5vZodkEgPh4EbP44i8LdHkPZ7atW/B6rS6xCivkF6NR12ah1y/OeBuvzZ11HhL8+IuXxV298VPPutwWHtJbPkPWiFKLG301f1PV1LbjCuvNJdoQmU3eVcnv1K24A2WWL6FACFHyJA1CW+Uv7nlRZ9ZaDu1OO0U9U6cTSaDPtshZRIhFoWY00g9vA8Onf56j71O56Zw/2JVrgyb3stC+XrTMEkuzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CY5PR11MB6512.namprd11.prod.outlook.com (2603:10b6:930:40::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 07:42:18 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 07:42:18 +0000
Date: Mon, 23 Mar 2026 07:42:06 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t 4/4] scripts/hooks: Example guc log copy script to
 attachments dir
Message-ID: <ccext2jfoheoalvp34mc3zds5w7yxeksyqu6xrchmlisnqcpwt@anivqhnhrxv7>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260319215124.2066611-6-zbigniew.kempczynski@intel.com>
 <20260319215124.2066611-10-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260319215124.2066611-10-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: TL2P290CA0011.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::14) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CY5PR11MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: 93957973-044e-4c99-8edb-08de88afb594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: SoM8kPBb0wXFYepVjplRWBdJHtXCPD4aGnkl6YHKQ/vBUVkhP3mEmPkBKp5lvaClFHp1xqcyGxlezrnO/ZRDIcnGC/yXAIiGd7sGXtaFiQ6jby11ukWV+zKZqMOd2ThY+h11gvvQknmIcW88XeASZkmR1Cmds47zF0KP8e2MclgQNdmdweZ6jNsrVpiiXitypBY8A5MsK01PjLGjTFra55JbG4Gw4/9FuxAGfujVFvlVSJPN6mw8Eze5NWsm7Y8CXDsRBoDSkcoGevS3mLbXz9zoihBTcGKUdDZQJ1Fg4pYyYN2W/nAqS5LG7VWQrZNUCQ6QL9SeBmw5mMbQ3oIUpx/qLHW63/HKMhljQHZRELySCFVBK2fHS9TDM7jY9JXYzDAK+s0qfVwesh2klWNO5EkgM8qwn81NQQMC59tmLxFXKvfOM3HClnerk4eAnedJ2t8rZPHnn6ySGyCqBIy0Z2TzXFMnGjQF6U/Q0+7AytNQKOQkWEUJfTkKfbOIoaYCuKCgfhOkrSQPyBJB1wmnmonknxoRj97Y9NUnPSoHRvoWDBXiE9g9G+8eaZSwj+bRoKCbdcSWXrAPz+AzbnII6QCdNV0DaBIfMiGw+M+8AzVkrho92WJGK9ARaQY9x3hxQ9yl0VDmSujTytKNdTUgI80Fkrp2nOGlyPXSlitQrM4pijakFZYBuPqQKyegbwQ24tngD7SxX/RkKQshx7hrMj5JrRsTNECZthOQEWtlz/0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1RHbjlsQndKekpsN0ROd0w2Rm1ad2M3dlpnNEFVeEljNmJDKzlEVDlPdXBZ?=
 =?utf-8?B?bERJdmZjNEtDUmt3OTdrdTFuS3czTkNTa2lGYzFxZkluV3djZ1E5aDM3a2RW?=
 =?utf-8?B?SVdaYmkvOCtKS3hJZmdKdGR3RncrS1RQUlB1UGxzVzQwYTRhQlUzTVlBVlpY?=
 =?utf-8?B?eElERmwyYmRqeTd1S05hQzU0MUdCdSthakttU1lQRERzSWRVMzZkNXNQdUNz?=
 =?utf-8?B?VHcwcHk4Y1VKSjRRK0NYZm0zakJzZWdmSUVVWGRTSG1XZG9xbjlaM3NMVDFW?=
 =?utf-8?B?YUovR2NGcDV2ekhHRXFmdTdPb2Y5RlZzckM2bVBINDNGM01WY2ZBMGlBNlBV?=
 =?utf-8?B?dmExcEpmdGpXZjJSdGJpalNrbGJhMkdsWUJkTUhPM1VaUjRQTURjUW9qaFZh?=
 =?utf-8?B?RTU1T3gvUWxtSDYyK0NyUHpnQzBKTEljbTd4OFZnSGhlcEVmR1gwazlBR2lB?=
 =?utf-8?B?U3REMllaQTNVbHNITC9DRVdEM0ZtaTlGUWFZdUxaR1pXVnpGUTVxekptOFlr?=
 =?utf-8?B?VGpZbm5LNUEvc2x5NGdicU5CNkJHL045QTBabUJkMXBWRkk4Nk9YbFZSWVNU?=
 =?utf-8?B?WVBQeXRkNkhaZUpkNnVFTHQydnhWQXQrNldxT3JXL1UvaGlkcCtzMFBRaVp1?=
 =?utf-8?B?cndITWYydFZWRGJSa1ltMXZQRU9KTG4vZVVPWXM0WXFwSnU5UG0wWDI0RGJS?=
 =?utf-8?B?SlU2cGF3QmhOSnpmNk9WVEUvVWxCUjFUY014WVhOd1dBK0NEQytGNEtJL3Jx?=
 =?utf-8?B?ZnIrWTZqZjdsZERTV3dQRnBzR3R5dVBQblV4SFplS0pNeENjdzAvNGFTWk5B?=
 =?utf-8?B?UFRPME9IeFpkRVZ2ZkdzelR6eHozT2dtendFT1Z3azIrb2toUWVLcHo1UFJS?=
 =?utf-8?B?djQ4TWRORXpIUmlQNnFTcW5YcTN5UjZ5ZENsZkNxZGhiQloybkdpUkpoN3hJ?=
 =?utf-8?B?QjZsL2wxOTY2RXlob2JxdVN4MVJPWjJjcEIvYUJzRGNkUWxEZTdxMk95VGVE?=
 =?utf-8?B?MnFSSXVzZXZsZUxyNGFOWGErdXQxSjFmUG8zd3FIK3k3ZWZmY3JOYUUyTUU0?=
 =?utf-8?B?amFYTXY5TlZzY3BZUkU4Zk9PZGM1ZXo2ZE9BR0RDa1VmZURkdmljeklYcElG?=
 =?utf-8?B?U2RIaUVCK0k5Vis2a1dmVmduY2xVUzZBMHFDb1RZcVBpMGhYZUpNTlJ5WGRa?=
 =?utf-8?B?WEpyTC9YMWRpY29pdkFSYU1QUHB1VStjUmZIazNjdzJkV2srNGFYNjJOOVNS?=
 =?utf-8?B?NDFTRXFYK0RHOHYxL05RYm1sQzZWWTNKMXd2cVF6eFdCTUdVTVlnNmp3dWZF?=
 =?utf-8?B?emVuKzN0L3VnR3hQTldPTHFTTWVzS2REWEpNdUtOQVRFa2JIK0lhanFXZXBy?=
 =?utf-8?B?c01MYitlY05id3hmYlc4NGpZWHViOG1KYjUzRGVERVFZbXdaUTdibUdtdzhz?=
 =?utf-8?B?R1dyUGI2emhWRFY0Z3BXK2svUEtiVmZ2eE5yVGZ2M093S2kwVlo4K2Z3V2Q4?=
 =?utf-8?B?NjhlOFVKY0lDaXBhVktCYXp4VjQ5NmlLN0NIQzhKVWhOOWk4ZUhFcDduMlBn?=
 =?utf-8?B?RHdqVnFoUG9KZWN5MVpaNGpNZ1lFVFJDdXhxUHI0M2hqRk9NVXVyako4VEIy?=
 =?utf-8?B?VlhaRmVZMmphNmE5OUd4MENuSXR4Z1o1ZG9IeDc1MFlabmZvRmlVS0VBV1hh?=
 =?utf-8?B?cVRMWlBUNFhMOUg3U1NOUkJyV0JGQnhDOG1CaUVUcHh5Y3RBRUsvZzBZY2Rw?=
 =?utf-8?B?SXNsa3YrMXZ6Y3l3NWJLWlpKVVFQTFI5bk5UT1FNV0t6cU9aR3lPcE9HMGNs?=
 =?utf-8?B?OUcxTWplclA4ejgzc1ZXWS9uMGJOQmNKYnpXSjE3YVVBZTZ4VFBKL2FnUmJp?=
 =?utf-8?B?eXJ5UGp1YW9sSWFQN21BUmJlYkVuY1NlRWNsVnJiUXRnSHAyaVVMU0FSTWc0?=
 =?utf-8?B?SjFvZ2xnamhMY0xBN3pHYlk4dUxyVC9Nd1EweHE5WDIrbE9wNkM2OXdaazY4?=
 =?utf-8?B?am1XNVM0TWRFWjVmZmczYys3bXVHeFVHQjcvL3ZSeE53RkN3OFdBdFJSSU1j?=
 =?utf-8?B?aFd6ckZkcW41Nms3eGNaNmFrRVlTUjBjRm1uL0djT2hFT2lWSEpCL1hWV3Nn?=
 =?utf-8?B?dlFVY0VLNVdISzFDTERNd2FTVVZzZUgxZThkeXpab0lUVDBva1RFNXFRWnpr?=
 =?utf-8?B?WEIwWTY4NE1SeUdFaEJVdnFlM2xhcVlMWEhZYWlVb0Rsa2N5N3p6ZENGSDk2?=
 =?utf-8?B?enNrWG84UTBnSXV6Z3gxczRIaWV1ZDBjTmlGVVp2bGN3NEd3Q2FqZGs5eHR4?=
 =?utf-8?B?NFp2M3FJMTJTaUdCV203Mi9sZWl4RUI2YWVSRDUvaS9HK1J3VUQ5OXhRcDZR?=
 =?utf-8?Q?oCc+7pOJee4qxEao=3D?=
X-Exchange-RoutingPolicyChecked: rDosCXSp1kbVq7hW3Fu4OVg18OMtsOST/+E4iRb66cOUcosHGyLT7E5k9nb4P4MAavWIq8rKIN8b/JCftzI26l3BW1WojUFNo8gpgk4aoeskffLTPTukcb+QSddD0xGra2vXCvErCkpuqccrdJpQKggHBZaIyECjdyaS4huPfdW9foVQHdyuCfcmz5oKjkanYFjLFGJnh8ha7UeVqv9aVYT9w2W85Rlc6kwmIJlKawIxgAmmgBR/mhoscNoCedAB4ZOKD6cpq+JZ6Cr2HSNFkyi1ihOWdcnzUtxObcUd7XYWAm+Q/Pde++NXXdEgQO5bRIBT5twl5VGfzvblod8DLA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 93957973-044e-4c99-8edb-08de88afb594
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 07:42:18.1589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFsVeCu/xOXQdPqTA/c25QFPgUkXo3Lg4hHnFMp/h1UmcnoQWzxgGM25wqpxRBtj3s5oGEJwpv2Txhao2rQaCE5IDt0Wv1S1Ute9cbi+c6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6512
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

Hi Zbigniew,

> We need to explicitly extract guc logs for failed tests so add
> hook script which does it after subtest/dynsubtest execution.
> As copying to attachments take a lot of time do it only for
> failing subtests.
> 
> Adding this hook script to CI will extend its execution time much
> (all failing subtests will copy their guc logs to attachments dir)
> so introducing some form of allow-listing will be necessary.
We might be able to do that with another env variable in the
future patches to this script. We definitely must limit the
number of tests for which copying is enabled.

> For example
> exiting immediately on tests where we know guc log might be not useful
> is simplest solution.

I think it would be good to mention that this script is not
designed to work with GPU selftests due to the current
limitation of GUC logs being stored in /dri directories, which
disappear upon module reload.

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  scripts/hooks/guc_copy_on_fail.sh | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100755 scripts/hooks/guc_copy_on_fail.sh
> 
> diff --git a/scripts/hooks/guc_copy_on_fail.sh b/scripts/hooks/guc_copy_on_fail.sh
> new file mode 100755
> index 0000000000..2360952634
> --- /dev/null
> +++ b/scripts/hooks/guc_copy_on_fail.sh
> @@ -0,0 +1,24 @@
> +#!/bin/bash
> +
> +# Hook script for copying guc.log.
> +# Suggested usage with:
> +# --hook 'post-subtest:scripts/hooks/guc_copy_on_fail.sh' --hook 'post-dyn-subtest:scripts/hooks/guc_copy_on_fail.sh'
> +
> +if [ -z "$IGT_RUNNER_ATTACHMENTS_DIR" ]; then
> +	echo "Missing IGT_RUNNER_ATTACHMENTS_DIR env"
> +	exit 0
> +fi
> +
> +cd "$IGT_RUNNER_ATTACHMENTS_DIR"
> +
> +# Copy only for failed subtests as this is time-consuming
> +if [ "${IGT_HOOK_RESULT}" != "FAIL" ]; then
> +	exit 0
> +fi
> +
> +STNAME="${IGT_HOOK_TEST_FULLNAME}"
> +
> +for log in $(find /sys/kernel/debug/dri -iname 'guc_log'); do
> +	attout=$(echo ${log:23} | sed -e 's/\//_/g')
> +	cp "$log" "${STNAME}@@${attout}"
> +done
> -- 
> 2.43.0
> 

-- 
Best Regards,
Krzysztof
