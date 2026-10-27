Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16E4606A31A
	for <igt-dev@archiver.kernel.org>; Tue, 27 Oct 2026 09:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IDiSZjgx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914BE10F2D4;
	Tue, 27 Oct 2026 09:09:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D5210F2D4
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Oct 2026 09:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793092085; x=1824628085;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wlAuPMCnVTTemBIXprNM+p0Z4ObjfekTMyww+NH0Rws=;
 b=IDiSZjgxKqlvzah1/R/FnFsUIzQy38rsIT71kWU2eJvhFzefAeEaTU97
 m/tOypq6Ax/HdirXrLmGWQkCfty44oyTjFGpQh8GE7bjqTpEv/VQhfKmU
 fNn4qPcJXsNbrw2IejGtsJdAPSmoiiBAM1oJ/Z+Kd2KeRPfacS2mtZ6Pl
 OgdVJuOCfpiFvawwV1Ba/qWt2k5jpEsRkk+qkt15DCQbnWOJS7pIu3v1H
 t9nuMUmCpcQ9PynfOKBIJJfV9Nxxrkiri7iRReFfSypBKfUw/nAivZRgA
 xTN/r7RLNzVJEad6/sKkOvWZPhyAiUlgjjiMZUrMZUn5LmErEorqGz2hj Q==;
X-CSE-ConnectionGUID: QVP0pp2dRsKwswdKcWZI9A==
X-CSE-MsgGUID: 9Zf8oYizTeqB5Irj65eP8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1794525"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1794525"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 02:08:04 -0700
X-CSE-ConnectionGUID: wZXTQc7eRpuLKQTXEf1Uzg==
X-CSE-MsgGUID: BJL6GUWkT3eoSDa61lGPgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4372112"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 02:08:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 02:08:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 02:08:03 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 02:08:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kgj+Oyx7oTdEjf5fUYM8Vm9J17pFtKBtb9kxo8HaFSRANjcYORPNCZLmRAh5EKhruP3XGtobLl/Qc7ALutbpvt0xdgPWsFcPWTDC2e9jPDHY/MDgOuGsPf3AxXPF7aiP00rDLLWHt7kHa5ZCHRb7DlPuYGKLwKSzNn4pssDBQekqNAawVDgX7guiMVYyLg8AtN3F6F4jauGvw6EovEweE/eXWZP4rPN60JGKbGJugyWeEm+BB1NuWqWqruY7nclgQtn2QamfORIvqAVgY1cZHsLscr5bWD0IVudKT9WryOqoQNSydZgmw96LltmHEUqII1HFCAPEQtPYRgJcB080Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ySqaaLXzI91Va9mPXtFZ+ufJkUeNAD70PtBRTpDT14=;
 b=lM7YpTCdJVCsX+PSbWsW+Scba1R6wCGFJTshlYnTxeEIEaFbh9QXhGh0IR5Uh7Nimr8xaJQoF6ONtcv2lj0pk7Zh/BtZAyiWHbHanCDlH5+3BRjg8ZH/rTU+TGmR7GYza8RblCRwotufaR8M/k7K77uXCrYag1TD2fKWOklHVfGaCSIGRQurHVxcJa0HRJL2ZvekAsqDhURFpx9dltVP34bZkysLvJYslG47IqxOqAjfk+myPBhwJcUU6XPNdifZpDk6mWa+tfSGLZUT9N7jGMIdDXX/DXojH0jlYJau0+w8r0s/8gX8YkR2paXEoxlVNVcGLlVEyCgEyIa2goLt0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5035.namprd11.prod.outlook.com (2603:10b6:806:116::21)
 by DM3PPF8F79256C7.namprd11.prod.outlook.com (2603:10b6:f:fc00::f37)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Tue, 27 Oct
 2026 09:08:01 +0000
Received: from SA2PR11MB5035.namprd11.prod.outlook.com
 ([fe80::9418:cd60:8ece:69c3]) by SA2PR11MB5035.namprd11.prod.outlook.com
 ([fe80::9418:cd60:8ece:69c3%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 09:08:01 +0000
Message-ID: <deb9d46f-1f18-48b0-946c-ca3b114a6be9@intel.com>
Date: Tue, 27 Oct 2026 14:37:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] tests/intel/xe_fault_injection: Reload audio
 driver on exit
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Grzelak, Michal" <michal.grzelak@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>, "Dugast,
 Francois" <francois.dugast@intel.com>
References: <20261015140035.2686997-1-chaitanya.kumar.borah@intel.com>
 <PH7PR11MB605341BE26FF6FE68947F4D3E7642@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <PH7PR11MB605341BE26FF6FE68947F4D3E7642@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0294.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::8) To SA2PR11MB5035.namprd11.prod.outlook.com
 (2603:10b6:806:116::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB5035:EE_|DM3PPF8F79256C7:EE_
X-MS-Office365-Filtering-Correlation-Id: f1adb6ec-c59a-4922-b54c-08df3409cd3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|261021123027099003|261026121527099003|261022105027099003|261022075727099003|4143699003|5023799004|11063799006|10067099003|261009223027099003|261021121427099003|261026140227099003|56012099006;
X-Microsoft-Antispam-Message-Info: qch/f2i/IvbwXoPLmSEQMUk7XJQ5D+bcuZ6nsQL+p94HU4AZfflg/qWkJjXIciT23zzYcpBj2Fhfi+l/Ej7pZUCtxQku8YZpnVh8qrohqa3Pbwo+0TaFbI5jQoE6xOyuRSS5w/KNXvWyAko2HAHq2YNT1+tsmaMTiR+7kIFS0M5M8MLwOp4Bx7c/nPJywAK7KR5UC9DdZLp3GmUo6ZzNUHsP3kuCcz/oaP6tofKm0XsKXogNlZwbxQ21c+f3Ynyux5G9v5Dpw1IiJdWehWnQXGbteZlFN3msSW+Kh0i7o4vkYVGDiD+MUtq5x3E2IVjkQHgnUj0MrQDpLsgmE2S4WSEqCMKNW8734yvlrw1lkgmtttDoYSOIKg5s1zVhJi7/PYC9XitClD3fvJWBKUHVjJMuIOofQIMlvSYWNjjPx37AcbYS3xoYKU8b0SnR+0IcUCtecq7TFzoJp14gFZiiQKZmvULXCcHbklnDK4FI6e9rvuIiOSX/bvb5qcK0dZfNlw7cmUuqKSJXAN3o3alhw4M1t1TgGVoj8WCFshIBn0Gz6WDQqn75475o8UFV5vtCHQ4HU7jegD/9E+F9l0QTULn0qFZyBafR1JH0IgC6qK023Xrbq58y2gbvKhNK2BAjKQn493+8kPyi3PSTFC8R3198g4UlMly5bTVuvTjKAk4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5035.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(261021123027099003)(261026121527099003)(261022105027099003)(261022075727099003)(4143699003)(5023799004)(11063799006)(10067099003)(261009223027099003)(261021121427099003)(261026140227099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjhyeGxadkdMTmxTbGZvK1BFdENmSHA0d2ZDWW9rNDk4RE1MclIvVWFQa2VR?=
 =?utf-8?B?UzBEZkJjQkJBRklndXg5cWgwUFRDanAxVE5Gcjc4Mnp5UDJZTEtGZVVhQWZh?=
 =?utf-8?B?ZkVkRlU3QUR5bTZoZktpenlBdFVUcU1pREVUNWNZNVd3b2wwSmFFWG5jK25V?=
 =?utf-8?B?TDN6a21HWjdCMHRJVngxVGU4SGwzU2EyWUsrbEpaSlRLT25UaFBRTzRIRkp6?=
 =?utf-8?B?MjRFbCtqcE1qWGxUQUNZdTduSUt1NkpoV3hFOTRSdDJyT3BWM2xCV01XN3Bs?=
 =?utf-8?B?aGM1SE1kY1BsbkwzQm02dThSQUVpYkd1a1NFaG5hbDFESFk0VnNRUFg3S2ZM?=
 =?utf-8?B?TDZjakhlbldkdEw4NGFQSUwwa2dwdGVIaVNVV241Y2xrMFJKOFF4TStqc3hr?=
 =?utf-8?B?MHFWYzVzZURZMGtiOURyQkJUeFA2WjFTQlhGSW9WOTlmQ0l0VDZadk05L2R1?=
 =?utf-8?B?RzgwNUptcHQ5M2JzYjlOOWFQeTAyWUkzNVpZamI3NFh2MENwdWZjS1VjanlU?=
 =?utf-8?B?V1ZIMU1LZlJXdzVpMlhMZUJwOGNkdTRFMldaSlIyYkJDYklkMjlMSnQxbUcy?=
 =?utf-8?B?RUdFTHMvb3BEMzZnZyszZFdoRi8vNStOQitUZUsxVWRsVktFeTRrWFlkM1N5?=
 =?utf-8?B?U2lsWXdqVHhVWlJSRGhJV1U1aHZvU3QzQXI3Zi85TXZFcWtkL09ScFUzTTFE?=
 =?utf-8?B?b3FoOFRuV1dKaGFzbUFjYUlhdXRNNm9kTWhoSU5tWGx2TnNjNXcyejVMRjN2?=
 =?utf-8?B?bEh6NUVsbHdsSktMYW04U3h6d29FSXB4emE3QThBNjRvbHFsWk8wdERlQjdK?=
 =?utf-8?B?ZjFSaGllVXNPUVQrRVdlY1dsSGZZQ1lHa3FKNW1LVWhwMi9zQWMxQ3dpMlpY?=
 =?utf-8?B?RkNCYTltZXRmYysrOGRXd21WREp6RGp2bDlhS0ZJUlFwSnlLa3I1YWxxUEFn?=
 =?utf-8?B?dU02R2F4VFdoTjJjb0dSd0ZZZnlhM1Bqc2MrdHRudzdTTGpjQ0F2TkRvMzNq?=
 =?utf-8?B?dWdWMDlOcHpqWlpHTnNBQWtIRTFzcHFFU2kyZVBGK2JQQ01sQUg3SjBDU01M?=
 =?utf-8?B?ZmU1cGhkcDI1bnR4ZkxYOHN6RXJLSU14TmxxcTB6MXRxckJjdjlPWGxvZ1hW?=
 =?utf-8?B?bHN3bkFGNVZrSUJWbHFiVEtwMitOZFhVV0NzbEtrc284RUQ0SmlRZUpUZy9q?=
 =?utf-8?B?WmM0andmQThSdTdGa2xGNHpnYlVVKzhubFliVGNwZkNqRVVqZC9qU1pTNkhT?=
 =?utf-8?B?aDdwcnBjZmVzWEwvb2ZoOW1SbXBnd0dhYUMzb0NLNi9oNnVoUk9EcUtacjJW?=
 =?utf-8?B?cFdmT3p4YzdxVFFJTld1RlN4alpUTlVLYkZmM29aS2d5SHlXRUF5SzN0TXFK?=
 =?utf-8?B?M29MaWN3U1hnV0ZDVWY2NUt4VE5xa3VJdWk3ZlRUTkdlVzNQMm9Ra1NyU20y?=
 =?utf-8?B?SEtncHd1cjRkUGZMY1lscExHMXF3a2tGSUpZV1FYTkhKanpLbmg4MHV5Rmhh?=
 =?utf-8?B?R0doQnNDYUthVmpLTlRMMk8yK1pxMWt1MWpQNzYvNC9zd1lubmlRTWhQOFpJ?=
 =?utf-8?B?UG1KQndUNGtNSTlLWWVCUFJSQUYyemNDVW5aa0Z4TlBQdVVQYTRKYURWL0tz?=
 =?utf-8?B?OVRLbmQ4SmlxYjVGU09CSUttUFBlYmNLdVpOY0hNK0x0VjNINHVQaTJXVitr?=
 =?utf-8?B?MmhsYkE1NHdIOWhTeUV4aDAvdEp2QnlvR1RBZjJRM2hWcVNwZCtEa1NsRStE?=
 =?utf-8?B?K1ZKNTVXYjBMYkRPVThsRzZSa3ArTkZENE9YUmZiOHJjcmFKaExoSVE0OWpx?=
 =?utf-8?B?Y1d6SzZUdVBORGs5M3dlR1h3b2dTQ3JHMzl6WUx3ZUlVcXA1VE1HblJ4S1ZI?=
 =?utf-8?B?bGhaNksyTzgwUEVqVEJGK3JyQm1VVTNUeFRzMnZFdURMUkIvaVoxdmlGVGtp?=
 =?utf-8?B?VlRsV3htUEQvazM4WEdlZEYvcU9GbUMwdnNHM0ZuM0k3L1c1d2ErOXBXL1kw?=
 =?utf-8?B?aU1XejExbkJ3d0tzK2lJakpQUFdieUtBVEF6YmZrVFMvK3l2Q2M4eDY5N3Yz?=
 =?utf-8?B?aGNIczkzUEZ3R0RNKzVvY2lHMnNScW9KYkgwMzJtTnRiN2FucXVMdWZsQ0Zp?=
 =?utf-8?B?SmRRS05wTnl0Y0FDM1ZQa3hFSmllcWExRk5zaGlIa2ZIWXRKZUtBZVlrTk9l?=
 =?utf-8?B?V0xWRVlpbWcxWXhidjlFVjlmd3ZQR0ZiUzlTc3FsbTBNSmw3Q1VFYi9DK0hU?=
 =?utf-8?B?UmMrVDkxUldnWnRzalEyV1JoZFVDeVlVYlN6Y3FsdmUyL3BUNnZNdzgxWVNx?=
 =?utf-8?B?WnMwdXI0UkwzT0F0NWp5OE9HUitBSmIzdFhjdFRZb2t4NlBDeW9RNkZBb25S?=
 =?utf-8?Q?Za6gPcIrN0gGPv48=3D?=
X-Exchange-RoutingPolicyChecked: JuDAdePgmrQVXSW2xkj8ZWGxJ47HtHnxf2R+faTZ0s9OR5lUXnKiisIJwg8AaAyxjPb6fbhWqX9u8qMMFTda27fxvw5cJOSFRUtK4oLUm5StFbMVwbaMv32ln1247qDRK5YRKjcVtpAdIiWjnCipdqrkUb2xfWm5+vITLMJoO6Ef5P+bww7Rk+eqM+av3huD9B/7Z9ZnyuFlmmIUukADCpBtz5d/uP6s7sHRL5gxSfIj255DQ5C+H+OXX+xpWdV3qJjGN90FCXjXXO46e4kgWg80d7wKm2YcQ+KxOPcBpC1qTYgYlmEFirRQ0VcW8WIQAvkszdc69M7NUAv9rgI8Mg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f1adb6ec-c59a-4922-b54c-08df3409cd3d
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5035.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 09:08:01.4647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GAH8SHUnClsMvtw682tZV5BWuEbbavt/dyYL4bXkiVAwe/4QX9h4yinXECQm3ewheDtOQirrMiUH6YEIcfe4V6tlxtU3t0rsR0XCMYctTgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF8F79256C7
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/23/2026 11:43 AM, Samala, Pranay wrote:
> Hi Chaitanya,
> 
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> Chaitanya Kumar Borah
>> Sent: Thursday, October 15, 2026 7:31 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Grzelak,
>> Michal <michal.grzelak@intel.com>; B, Jeevan <jeevan.b@intel.com>;
>> Sharma, Swati2 <swati2.sharma@intel.com>; Dugast, Francois
>> <francois.dugast@intel.com>
>> Subject: [PATCH i-g-t 1/3] tests/intel/xe_fault_injection: Reload audio driver
>> on exit
>>
>> Commit 117e9ecbdd1d ("xe/igt_kmod_unbind: release audio before
>> unbinding xe") made igt_audio_driver_unload() be called before unbinding
>> xe to avoid the audio-component bind warnings/errors that happen if xe is
>> removed while snd_hda_intel is still attached. These call sites passed NULL
>> for the unloaded driver name, so it was never tracked, and nothing in this file
>> ever reloaded it afterwards.
>>
>> As a result snd_hda_intel/snd_hdmi_lpe_audio is left unloaded for the rest
>> of the boot even when every subtest passes, since the test's own teardown
>> only ever rebinds xe, never the audio driver.
>>
>> Capture the unloaded driver name and reload it from the exit handler, which
>> IGT guarantees runs on both normal completion and a fatal abort.
>>
> 
> Since these fixes from a specific commit, better to add fixes tag here.
> 

Oops I did not know they were a thing in IGT since there is no 
versioning but I now see that is not the case. I will add it.

>> Cc: Michał Grzelak <michal.grzelak@intel.com>
>> Cc: Jeevan B <jeevan.b@intel.com>
>> Cc: Swati Sharma <swati2.sharma@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> ---
>>   tests/intel/xe_fault_injection.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
>> index e32f841a3..3713abe23 100644
>> --- a/tests/intel/xe_fault_injection.c
>> +++ b/tests/intel/xe_fault_injection.c
>> @@ -31,6 +31,7 @@
>>   #define MAX_INJECTIONS_PER_ITER	100
>>
>>   int32_t inject_iters_raw;
>> +static char *snd_driver;
>>   struct fault_injection_params {
>>   	/* @probability: Likelihood of failure injection, in percent. */
>>   	uint32_t probability;
>> @@ -196,6 +197,12 @@ static void setup_injection_fault(const struct
>> fault_injection_params *fault_par  static void cleanup_injection_fault(int sig)
>> {
>>   	injection_list_clear();
>> +
>> +	if (snd_driver) {
>> +		igt_kmod_load(snd_driver, NULL);
> 
> 1. igt_kmod_load() reports the failure reason only via igt_debug(), which is below the default log level (igt_info).
> So, on failure it leaves no trace in normal run. Could we surface it at warn level (igt_warn)? something like,
> 	if (igt_kmod_load(snd_driver, NULL))
> 		igt_warn("Failed to reload %s\n", snd_driver);

Makes sense, I am planning a new helper where I will fold this in.

> 
> 2. Since the reload is placed after injection_list_clear(), it depends on the clear succeeding. injection_list_clear()
> can assert (igt_assert_lte() in injection_list_add()), and an assert failing in an exit handler _exit()s straight
> away (igt_fail() -> in_atexit_handler), so the reload would be skipped and audio left unloaded.
> Can we move igt_kmod_load() before injection_list_clear() ?
> 

ack.

> Do correct me if I have missed or misread anything here.
> 
> Regards,
> Pranay
> 
>> +		free(snd_driver);
>> +		snd_driver = NULL;
>> +	}
>>   }
>>
>>   static int get_remaining_injection_count(void)
>> @@ -312,7 +319,7 @@ static void probe_fail_guc(const char pci_slot[], const
>> char function_name[],
>>   		fault_params->times = MAX_INJECTIONS_PER_ITER;
>>   		setup_injection_fault(fault_params);
>>   		inject_fault_probe(pci_slot, function_name);
>> -		igt_audio_driver_unload(NULL);
>> +		igt_audio_driver_unload(&snd_driver);
>>   		igt_kmod_unbind("xe", pci_slot);
>>
>>   		/*
>> @@ -668,7 +675,7 @@ int igt_main_args("I:", NULL, help_str, opt_handler,
>> NULL)
>>   	igt_fixture() {
>>   		close(sysfs);
>>   		drm_close_driver(fd);
>> -		igt_audio_driver_unload(NULL);
>> +		igt_audio_driver_unload(&snd_driver);
>>   		igt_kmod_unbind("xe", pci_slot);
>>   	}
>>
>> @@ -680,7 +687,7 @@ int igt_main_args("I:", NULL, help_str, opt_handler,
>> NULL)
>>   			err = inject_fault_probe(pci_slot, s->name);
>>
>>   			igt_assert_eq(should_pass ? 0 : INJECT_ERRNO, err);
>> -			igt_audio_driver_unload(NULL);
>> +			igt_audio_driver_unload(&snd_driver);
>>   			igt_kmod_unbind("xe", pci_slot);
>>   		}
>>
>> --
>> 2.50.1
> 

