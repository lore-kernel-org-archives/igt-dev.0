Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B36EC54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 05:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9539E11244D;
	Fri, 22 Mar 2024 05:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KaHAOiXH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509C411244C
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 05:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711084855; x=1742620855;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4t6ZBYssWWZYFMY6E2xaH5iP1XCIH1cy3+k6KB1DGQ4=;
 b=KaHAOiXHyCU7MxDLtErXFa3W6op4rE6CDzclSR6GLPzKg9bXUnXtDEFl
 GC+/OsUo29JBU8KdwEuPHsBiZLEkl8gPUz9jzdEQ/HhjZKCxkxa+4UCX7
 Q8tdScxbVjL6ylGjRtQ7MXLHaFkrmSL/6RnAnMI3n9S752loa4dPFtfdH
 mi/DLGAZLYFeZFjCy/CT7pIVYAM1LqKviH80kG4nklgcgqGGn1km5qxsg
 IDVtEaKzOp0VuBOzS6vGCqROR4FaCmSqkuyzz2qzwtpdbkuVkwdrm81PZ
 17Qntm/VrKcc9eJGBKs2uXLJrX+lH/YSMshXHOfPTYmr928U2kLyjQgOX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="28589732"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="28589732"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 22:20:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="19490727"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 22:20:54 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 22:20:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 22:20:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 22:20:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUYU+mQR4WSSRyXgMxnSioWL8iJoVjKiMBy4Zk0STJfm55vpl/wHGQQrZLXeWxpAbQi8GzjxX/lCbffejhw0Q0p/7cWX7VgAz2hjERg3MQGaE0xcvVjgE9hwPVrXljGo6/Bd/XJKlf/6YHAu6G/qGb52p+89SRWigzI+0Iq4fcjstuya/mzzdzYqEi59dSJHKpnIOiCTpWLbgIwRBSVX20+HygWjkvrqTPgq77izYGZjpLIVN4WPTDiRxD2/EexUjT5xhrgBjXPVWeRXDhvQfyx+U1F4LxOx6Lx8oqZU48ZP2QqcN0RB1rjgYP3S+S0Yh/0fd/SfUcRNrz8/ijZuRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36CBkbtS4eE7iGcj9ZwbXZ0ADGiqcoJ8LBL7Ykn7EV0=;
 b=Y2pEAW/vhr/0FMeglnzg2GkZOMDj1fLf8+oKm3D4Op8vlVOg3R/R2K6dxX2OjJGi8CcCSffzj9i3iai55xGjOxN8z6BNm29hfYb1mlhtU1i9N1QjVZ3ozjQBKjDyjvTjuuS11K4OeO63oHBsCgnxVoVjzPmvbW6+sXtTCmBeNvcL1RHmZ2TC5/2ceevxc15/ivrPQPTziKR4xZBSuPyPVwBGnAAXZQcmYpMM38tS9gs1M8JGSJj76xvxjAAMCWEjefZuI9plcO6FGXiI+XyF6Dx69I5rOkkzuTSk8NeVUrZ79m5HySurn3Q2IJYaYB4W8MWXC4TgI4fVXZfg3SgdhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SA0PR11MB7157.namprd11.prod.outlook.com (2603:10b6:806:24b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.23; Fri, 22 Mar
 2024 05:20:50 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 05:20:50 +0000
Message-ID: <a31623e2-6cf4-44da-acd6-70572bbbd24f@intel.com>
Date: Fri, 22 Mar 2024 10:50:33 +0530
User-Agent: Mozilla Thunderbird
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH v3] tests/kms_vrr: Add a subtest for seamless modeset to a
 virtual LRR mode
To: Manasi Navare <navaremanasi@chromium.org>, <igt-dev@lists.freedesktop.org>
CC: Drew Davenport <ddavenport@chromium.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, "Golani,
 Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
References: <20240319163338.3993235-1-navaremanasi@chromium.org>
Content-Language: en-US
In-Reply-To: <20240319163338.3993235-1-navaremanasi@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SA0PR11MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: f6939304-0b79-411d-5a01-08dc4a2fd6a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: USWQnyTnEf45lwvLuRXhWj+QE02gDWB9fb3ZknxLeObEYeNmMU2lVyme8nnDU//y+i51NlH90SSPflm2elFc569AdMJqRVsHZmd9VnxOJV2xmH5Fvr+S84tYU7lEj/FLf+fEBTAwobveb7h53Wxt9g1RwR9kJORUi2ArGm+LCMCaqbOpbQKz3NKEKry1p5CSrqsZ9j6hOkarKg0AsrgnJ1dYGthuoHU6LbpL0CFujxljgP5MuLrcEH52+G6/Q6iXsfg7XyK5n1UNWjWjrkHXe02KX0kLZs01Yc9DByG3tohihEU1BhzOWRxZOvKUiCJQ7YxSabCqEEprpLuYzGjmwNoGQ9iRwXAnLIqYJK7NK0imzeA25Kb2lFQkNmObNQH3QRP8fytn6AdgjH46twuCsM5IPdUNqzarqZ1GZgzNdoQR4KXKWrecvze2l6nzdCHVDsOKw22cQ5x7pkGlD0ZSdeIYf8I8ve8w/EF+uQouQ7orAocRuBhUb9Sw25Fg7Bnwti7Jq05kzz17mJarjR4AIqyXmmFWCvI3NvNd/DiRVUx+PGKznIkaDG7izk2kqr8ROGfICmEmCSSRDnoQ6xBlJsV17+ebkyDfi2WfuV/WPOXzdVyJe/Kc/g9XpWj8CAscwSPKhCln4c37t31ZHWVcpuVzECeMHehFwE2liwJnc1U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFdHSEIwVEo2OEJ2YVV5dmk1cnpOWkExeWRsaXRDcnduTUpLaEgvYndYNVJk?=
 =?utf-8?B?d2RTenR2cTdTUytVS1hqVGJpTWVLY3krcVlESXZCRnlpVVhNdk92ajMrMnp2?=
 =?utf-8?B?NlVFUmY1Q1ErcmJrZXNReW1IZWd4RUFiYk9mSlFGT0cxQzRQdU04a2RzN0gr?=
 =?utf-8?B?Um5qQVVsS05YMGRTUUZyRnhOZzdlU21yQjFrVGxmS1VrRnlCamFqcWpFM3RG?=
 =?utf-8?B?eDViOTNjT1ZRZzZTUlhucGF0ZkE0aGtmdlJ3eHM1OHJpV0tKTHBZZ2tzU0Fo?=
 =?utf-8?B?WTRHTDJ4RGxPdmROUDkvVFZaYnRwcEZ4TVNhS3JpQTUzU3YxQ1hvZ2xxd1hk?=
 =?utf-8?B?Yjk1bnpYTDVGRlgycGpSMExTZ2Zia0o0aUIyWUlmSStac2o3VG5IYjg3UmIv?=
 =?utf-8?B?VXRtYzB0cE15YkcwWHhqQlZIR3lOclVVYTFQV0hTQVpPSFZoa0xyd1FuN0Jm?=
 =?utf-8?B?ZXhXaTZYSDVobjVGbXIwOW5WS3hlZmlBRGxBNlMzSTlPdjVwZXdnQzJyeGow?=
 =?utf-8?B?anYwV0E3ajNZOHN3SmJjZk9EUnJ4S1R1MjZEYzZTZGczZlZxYlJxMzZIMXFz?=
 =?utf-8?B?Zjl1RDNLblZGaVkwazNYRSs0Zy83Vm1waXhudnNKRFhCa09rYWNEbjZxNnhv?=
 =?utf-8?B?UFVnbVc5YXgxSUp6VFlVcWNoMU9TaWpHU29xVlAxVi90dTFrRnpNQVFpME1a?=
 =?utf-8?B?NU5FUXJLUWVwRnJDcXRTUFl5Y3lUL2I0aG9nMTM0dXRLZTF3cWtWWjI1bXNV?=
 =?utf-8?B?RDloWWFYb1Y0d3NHa05CbXZ4U25vUUNkc1RBM2VFclUzUklodGdTZ2lKMWpi?=
 =?utf-8?B?eGE4ZHFxbVZFL2NoQXdvSE5UcHFvUVllNHRRUmo4cDBlWHVUd2Z0RTZLb3Y0?=
 =?utf-8?B?OEJURkI4UWZFbkFsdUk4ZGFPb3A1SWNoV2FtSklIOEx1eXcxempzRlczSEtQ?=
 =?utf-8?B?WDlyZW9TQVozK0lLYzNOcWJhQjhFNVFOK3p0MmlXRThDb0NFR0V0cXZ5OVFv?=
 =?utf-8?B?VzNaWmVIbVFmQ1JLYXJwaVhQTG1uQVY5TGZiYmhoUWN3cWFqN2hkQ203K3Uy?=
 =?utf-8?B?eHN0SkNXQmppWXprNEVVT1E2S2ZPSm9WWk5oeFhNa0VuWVhaMnNmUXVldEZt?=
 =?utf-8?B?MG1MU2dHOC90dlJRN3FEZWVrYmMyNFdDMitaLy9rc09QUUZqYUd4aDNsNjJ3?=
 =?utf-8?B?N0V3T3Q4WCsvVmdtUmN4akRmMVorTUtuNVZ3d1J0TzI5ak1zM3VZMzYzN3lF?=
 =?utf-8?B?MzU0eFU0TnpYeDFTREdtVGh6OW12Z2pwMUhpUEVqb3dnaStTdVNlTXdpNUVS?=
 =?utf-8?B?bFY3TjJyZStKelQ3eXhBbjlkVitVNkZ6YzNXaWJjMDNraXZtRnZxUGdvY20r?=
 =?utf-8?B?WWttcnJPRFpOSGVKUWRHVVQ5R1FpQzlnWnhmSEcvc1ZwNDVDaVFyNWRXWVFI?=
 =?utf-8?B?VmlBUlFOZUhTbGw2U2ZvWmlaTWg0ZFZyZkw0MGtnZzk4aFBTcmtuTFhlOUdL?=
 =?utf-8?B?QVBRaktMWit1eTBSdDlrV1NPaG52UTBjekJFMmJvS2VhSWJ5dWExb3ZoNVUr?=
 =?utf-8?B?c1hYNGNMZmlFNjVwSmtLVlQ4NURKUlRuY09qQTZUTGI1N3ljaWNYZzFkUVFj?=
 =?utf-8?B?VmFmMFBUQmc4aTlMMURLVDVXOW1XaWJ2dVZFK01uSWVocXhaYW9TZ3FJVjJR?=
 =?utf-8?B?Y2Jkb0hISERzZU1nRzhKdzVzRkNNOUFkc2x1Y3ZOVHZXY3BwYmVxRUZWL3Aw?=
 =?utf-8?B?cUhFK3dza09KSDdWYVhhMjNIWWN1WjBsR0pFS3NWdW9KRHFZbWhkemZXYXZX?=
 =?utf-8?B?QXZpRjZyR0tSemp5d1NiMk5hOEJoeGQ4UUVpanZqOEFaTVdIV2ROajlUWDNE?=
 =?utf-8?B?YllIQW5jUU5jWmdUdk1QVEI5cHoxTjkzMDJITCtnd0hYUjNvNVAyY1Zhc1BI?=
 =?utf-8?B?VVNMZ3dKcVhNVjVuYnJLT2VHSWw2Zlh0TnFCNWRDbXVLL2dKTGpjWlc2dk1n?=
 =?utf-8?B?Y2w3SXNWV2FUZGJ2eFkrZGNiTTNLb1lOditSY2ZPbktDUXJPZlE5emVTUElV?=
 =?utf-8?B?aVB6UEJZNUpEekNUeWpBTEl1V09IdDUxMjlWckFTanRDRlRocGZ2S1Jrank2?=
 =?utf-8?B?d3VWd1FhTkswYWdNQnYzclpiajhWVmJVTkJrZ1UyTVVLZHhob2p4VEwydEhn?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6939304-0b79-411d-5a01-08dc4a2fd6a3
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 05:20:50.7955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VyeD3GLQXoJSHBWfQzCn9W5sQEeSBDpQfo/91aP3CwFWTxXV/GXdtVG0sbasNh7Bg/RITpfgIiBMCPbrGcEkEiv05hkAk8D6WTM0QOd8crc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7157
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

Hi Manasi,

Thanks for the patch, unfortunately it is not compiling cleanly in my WS 
and getting below warnings:

[2/11] Compiling C object tests/kms_vrr.p/kms_vrr.c.o
../tests/kms_vrr.c: In function ‘virtual_rr_vrr_range_mode’:
../tests/kms_vrr.c:229:22: warning: unused variable ‘connector’ 
[-Wunused-variable]
   229 |  drmModeConnectorPtr connector = output->config.connector;
       |                      ^~~~~~~~~
../tests/kms_vrr.c:227:6: warning: unused variable ‘i’ [-Wunused-variable]
   227 |  int i;
       |      ^
../tests/kms_vrr.c: In function ‘test_seamless_virtual_rr_basic’:
../tests/kms_vrr.c:685:48: warning: passing argument 4 of 
‘flip_and_measure’ makes pointer from integer without a cast 
[-Wint-conversion]
   685 |  result = flip_and_measure(data, output, pipe, rate, 1, 
TEST_DURATION_NS);
       |                                                ^~~~
       |                                                |
       |                                                uint64_t {aka 
long unsigned int}
../tests/kms_vrr.c:413:14: note: expected ‘uint64_t *’ {aka ‘long 
unsigned int *’} but argument is of type ‘uint64_t’ {aka ‘long unsigned 
int’}
   413 |    uint64_t *rates_ns, int num_rates, uint64_t duration_ns)
       |    ~~~~~~~~~~^~~~~~~~
../tests/kms_vrr.c:700:49: warning: passing argument 4 of 
‘flip_and_measure’ makes pointer from integer without a cast 
[-Wint-conversion]
   700 |   result = flip_and_measure(data, output, pipe, rate, 1, 
TEST_DURATION_NS);
       |                                                 ^~~~
       |                                                 |
       |                                                 uint64_t {aka 
long unsigned int}
../tests/kms_vrr.c:413:14: note: expected ‘uint64_t *’ {aka ‘long 
unsigned int *’} but argument is of type ‘uint64_t’ {aka ‘long unsigned 
int’}
   413 |    uint64_t *rates_ns, int num_rates, uint64_t duration_ns)
       |    ~~~~~~~~~~^~~~~~~~


On 19-03-2024 10:03 pm, Manasi Navare wrote:
> This subtest validates LRR fastset functionality by testing seamless switching
> without full modeset to any of the virtual LRR mode within VRR range.
> Here we start from highest refresh rate mode and then switch to virtual LRR
> modes in the steps of 10Hz within the VRR range.
> 
> This is used to test the LRR fastset functionality of the driver.
> 
> v3:
> - Fix build error due to rebase (Manasi)
> 
> Cc: Drew Davenport <ddavenport@chromium.org>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Manasi Navare <navaremanasi@chromium.org>
> ---
>   tests/kms_vrr.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 67 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 15c62b34b..316b626c3 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -70,6 +70,11 @@
>    * Description: Oscillates between highest and lowest refresh each frame for
>    *              manual flicker profiling
>    *
> + * SUBTEST: seamless-virtual-rr-switch

IMHO, we need to update the subtest name as 'seamless-rr-switch-virtual' 
to match with other subtests 'seamless-rr-switch-(drrs | vrr)'.

> + * Description: Test to create a Virtual Mode in VRR range and switch to it
> + * 		without a full modeset.
> + * Functionality: LRR
> + *
>    * SUBTEST: negative-basic
>    * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
>    */
> @@ -92,11 +97,13 @@ enum {
>   	TEST_FASTSET = 1 << 6,
>   	TEST_MAXMIN = 1 << 7,
>   	TEST_NEGATIVE = 1 << 8,
> +	TEST_SEAMLESS_VIRTUAL_RR = 1 << 9,

IMHO, we could move this enum just after the TEST_SEAMLESS_DRRS or just 
before the TEST_NEGATIVE.

>   };
>   
>   enum {
>   	HIGH_RR_MODE,
>   	LOW_RR_MODE,
> +	VIRTUAL_RR_MODE,
>   	RR_MODES_COUNT,
>   };
>   
> @@ -214,6 +221,19 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
>   	return mode;
>   }
>   
> +static drmModeModeInfo
> +virtual_rr_vrr_range_mode(igt_output_t *output, unsigned int virtual_refresh_rate)
> +{
> +	int i;
> +	drmModeConnectorPtr connector = output->config.connector;

Please drop these unused variables 'i' & 'connector'.

> +	drmModeModeInfo mode = *igt_output_get_mode(output);
> +	uint64_t clock_hz = mode.clock * 1000;
> +
> +	mode.vtotal = clock_hz / (mode.htotal * virtual_refresh_rate);
> +	mode.vrefresh = virtual_refresh_rate;

Please add a new line here.

> +	return mode;
> +}
> +
>   /* Read min and max vrr range from the connector debugfs. */
>   static range_t
>   get_vrr_range(data_t *data, igt_output_t *output)
> @@ -641,6 +661,48 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
>   		     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
>   }
>   
> +static void
> +test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
> +{
> +	uint32_t result;
> +	uint64_t rate;

Please declare the variable 'rate' as array or pass it's reference to 
flip_and_measure().

> +	unsigned int vrefresh;
> +
> +	igt_info("Use HIGH_RR Mode as default\n");
> +	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> +
> +	prepare_test(data, output, pipe);
> +	rate = rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
> +
> +	/*
> +	 * Sink with DRR and VRR can be in downclock mode so
> +	 * switch to highest refresh rate mode.
> +	 */
> +	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
> +	igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
> +
> +	result = flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
> +	igt_assert_f(result > 75,
> +		     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
> +		     data->switch_modes[HIGH_RR_MODE].vrefresh, rate, result);
> +
> +	/* Switch to Virtual RR */
> +	for (vrefresh = data->range.min + 10; vrefresh < data->range.max; vrefresh += 10) {
> +
Please drop this new line.

> +		data->switch_modes[VIRTUAL_RR_MODE] = virtual_rr_vrr_range_mode(output, vrefresh);

Do we really need this 'VIRTUAL_RR_MODE' enum? Instead we can use a 
local variable.

drmModeModeInfo mode = virtual_rr_vrr_range_mode(output, vrefresh);

> +		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
> +		kmstest_dump_mode(&data->switch_modes[VIRTUAL_RR_MODE]);

Please add a new line here.

> +		igt_output_override_mode(output, &data->switch_modes[VIRTUAL_RR_MODE]);
> +		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
> +
> +		rate = rate_from_refresh(vrefresh);
> +		result = flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
> +		igt_assert_f(result > 75,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
> +			     vrefresh, rate, result);
> +	}
> +}
> +
>   static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
>   {
>   	if (vrr_capable(output))
> @@ -686,7 +748,7 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
>   	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
>   
>   	/* Search for a low refresh rate mode. */
> -	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
> +	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_SEAMLESS_VIRTUAL_RR)))
>   		return true;
>   
>   	data->switch_modes[LOW_RR_MODE] = low_rr_mode_with_same_res(output, data->range.min);
> @@ -841,6 +903,10 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   			     "between flip timestamps converges to the requested rate");
>   		igt_subtest_with_dynamic("flip-basic-fastset")
>   			run_vrr_test(&data, test_basic, TEST_FASTSET);
> +
> +		igt_describe("Test to switch to any custom virtual mode in VRR range without modeset.");
> +		igt_subtest_with_dynamic("seamless-virtual-rr-switch")
> +			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
>   	}
>   
>   	igt_fixture {
