Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D427606A32F
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 20:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bmLggfkp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7990D10FED2;
	Wed,  4 Nov 2026 20:08:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E72210E895
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 20:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793822850; x=1825358850;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IXDQYkLskM7s+ht3nRrujx8Pxek5notXYzVQEkJddto=;
 b=bmLggfkpCBHldwsJHgmkdPovQ6KusiKMmt3kholhZrA/T+sma9Tw8pCu
 ZCWYwUP2ugF4tt8fs4gPnQel5yXSNb5+3FGQCDU5R42S2QC08VVsoFITx
 WSiPHwy5rVt8fcMi2zCOy1Ul0IGNOQwvEpC4DPUPOb+M2pS3r7BRNkSSv
 agYczsukI5A8biIQhF7Q4d98DX8qpl7pol+zI5fvmL2wFsXUamTWuVGJN
 ahADJncB3b7t7zIf0uCnsqSiP0H7ROivOnvojXF+58gHo81euXvq1qBS+
 m6FSsHVEngWifWP/oJtozdsk82DuITGh2y2fhKVwyfYWwCKAz7l5TnJHt g==;
X-CSE-ConnectionGUID: j5Uf3hQ8T6KbFLnUHCesDA==
X-CSE-MsgGUID: ZWoA6NhNTkGuirt1NCxHsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2697361"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2697361"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 12:07:29 -0800
X-CSE-ConnectionGUID: CEkeE+oNSn+wrq+GGmTO1g==
X-CSE-MsgGUID: vmwnh3xfSV2vz6zOgkt7Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6962843"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 12:07:29 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 12:07:28 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 12:07:28 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 12:07:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxLztoSW72jL9C2NeejoyYsz4Cye8vj+/PmKL/7seZK12NnKx/EvLI4l/cI+iBmN8MTBLOCJHg2xbd4FNnhwyt+qHeSaDzoBwt5GEUEM0qK29IGVYqhQYGiIaVGHa+CqO9cqlWJ2b+140Em4l5x60E2TZa8XI5JVVbdtJpeBGw9WLb1p7jtk1DrXUmbNnzImE100E7OqeKA1Zkk34q8HDUxWNYOsSiP5cWpTBtSs5Ht+6I5u3ayPVegoSto67Fu1ItBY6qGPN5DhbMN5rA2zHiZz+B19dLqEqm9bVbpkL2NmmlyVzkKDOxwJ1yC1uP1uueZ+AU6ar/jgu0Xms/qqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlhPJyBdQgNSI4NI1Om5Bii8XTzPE6s/YLhIBwWHwtU=;
 b=HviXLtsQqj6nMyjoDBMa1ZnShASLsDWAAUOIxw/28lVjiv3Dp9JCNZk4cFnN5c91Zchvr68+0bPqEWKNY7JrZ8LAKsW5CzT1GBrlMc8DtMBBqUi/pe0XNWjJGU3nB1bkg+Li0vy8yvwVKx0pPszIrNwQyQzapDQM2DYxHSw8edq85NW7eVFguibQ+E4szVcmmPx22H9tsdj7U6ytBq0OI2tS9jmPdHZeKvwsV8jIQebJuxizd05lpSgWEGNQSkZcwZdN38CzPDPm33FJPdjhi9jzoH+7OtnzzKC7c5k3OZexa09n4djCkeV2QlK4i/8irlgSsq6EwsK2TZgFkZsfSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by CH0PR11MB8167.namprd11.prod.outlook.com (2603:10b6:610:192::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 20:07:27 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962%5]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 20:07:23 +0000
Message-ID: <c5f2d253-3585-486a-ab64-08f01130e969@intel.com>
Date: Wed, 4 Nov 2026 12:07:22 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/2] tests/intel/xe_exec_threads: Parametrise
 worker and queue counts
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20261103195149.48923-1-jagmeet.randhawa@intel.com>
 <aut4OMBl-hC6jSRD@nvishwa1-desk>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <aut4OMBl-hC6jSRD@nvishwa1-desk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::16) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|CH0PR11MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: 2211a131-3b8f-4754-0843-08df3aaf3d85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|261022105027099003|4143699003|11063799006|10067099003|261021123027099003|56012099006|261009223027099003|261028144727099003|261021121427099003|261022075727099003|261026121527099003|261102123227099003|261026140227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6FZZangWYgMdLpSmLTmGUXxQMZxSjwHP3aHUZocJN6SRsJPh0hft+ZX1g7X8iXn9Pn+eALSF5R77zu8+qQt08NFH57R4x/5eaKOGpJel3hjhVx2PZreeCySscSYmcai+EfXi2B/Qupt2WtbUOtUVtLvwqOafQQC/3av934INp1mHr7pIonMEoLa6tQ2RwUll8hmq+A6owAh+WrQk7bTyLAQI8xtd6XACzJX3Bk+nhm5NTb/zn95oi2r6kF8BTYO/V84vFbLV3XkXJJioXx4zzQN9jBUDfPspR4M7X84GllllvRRYsMDVnAH7agubciesRlCFhrNQworIyhbNUdMu3DH37kZlHjN8W13s4XspyElB5pqKnDA4HRIlidJ+yFJYKevi1JatAaJVzZLyq9YStptbiy5J+kNXClyVGeuZi09SJL6xtIblzcBxF4Eccdu8+Ymoa3t4r+lkLICnAnEc1anz4k563Ky3hLmf2zzukLeD26DOOOLY7BEyBwT8GyhuziK2M6NAQjkSu72t96bl1wy4t7dE7AxKxlrLuaV6SOy35z0zsDJRrn/LjBZf8adiWCDzacRjfYMLYkkkoLzVOly+NX/doHrcsBAfpHNDcmhDi7h9xwZcYg7yBHZwHy70/PyXRifGhg2ti6rYdcTvdCz2UjgWo8/Jq4yVRsOssZs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261022105027099003)(4143699003)(11063799006)(10067099003)(261021123027099003)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261022075727099003)(261026121527099003)(261102123227099003)(261026140227099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXZMWERRYU1FV2pOVWNaVWVOZzZvdVUzVEExQXdFa1U1VVA0SEhnTnFHWXVa?=
 =?utf-8?B?WkhqQTNvcUhqd2lqc2xiNnBFaEZMbXJVemdkdTh2dStta0cwbzJwV0Rwdnp2?=
 =?utf-8?B?MVcxYlR6clNVdDhtdU5MeDFER2xvT2xRUzdvZTBrYjhFV3lpbURkNEsxWGJq?=
 =?utf-8?B?NERXekx3U0V5OXRNZGUzTjY5NHhIbitVNGdpUHZscmxGS2NFOEc0ZGVQVXhu?=
 =?utf-8?B?RzAvZ0xWR3dFdHVrcitJRDZmbVJwQzVBOEJoTHF3R0hhazRndHJxQzFYOVIy?=
 =?utf-8?B?UGhSN1ZiN0djNDZWeldjUzJPUEJtV2oyV3RZS0JOOTM3NElSSTJ5RUV5Qk13?=
 =?utf-8?B?eG81TmliNjJBT3lMUGNIRlV4bTNUcmdHK0xUYzliVWh5eW5teFhoTmFCTlhp?=
 =?utf-8?B?cEo5MWRjSjRQdFZkNkFZVWpZVTA4WTBxM0x5aXYzV2VDMlZPVEltd2RhR01L?=
 =?utf-8?B?TVd4Y3Y1UVkrYU5hR1U1RUduSzVhTVI3OHF6WlF0N0tZTW9yL3MvdXhORVBW?=
 =?utf-8?B?VEJTblBRYUhRZUtiYXJMekNYVDRpRUJ6VWZkSVhuL0tIUUUva0hkY2NlQmlZ?=
 =?utf-8?B?TTlNM0pTckovR0FHejJmMnZaQUdWemlsNXVsQXgySWFVRFQrTVU1dk15ZUFF?=
 =?utf-8?B?cU5RZHhDRnFzZm5KRWU2cjhMc0IwZFpvbHR5Z1J3Sk1Cencrb2hub2txUkc1?=
 =?utf-8?B?aDk5anBtbEtmTkVkZkMwY24xRjRuMnY3MUUrOTRXK2pVTWZ3WlUrWVRQZDRh?=
 =?utf-8?B?cGx2RWVaOEZWTDBzc01UWkZRUE5pTTAzaXhZMXlPSFZDZ3RVR21UNTR6TXUy?=
 =?utf-8?B?QjRMMVI4cXhNdVpaYXk1dlR0bjBxeFk4M3FGZEVWa284SWFFUVJQdmlxbTIv?=
 =?utf-8?B?WG50VHFTcHpvQVJmWDlaRHNWZDVLWG9pRVhZK1RvV3h2YWdnK0E3d1NPcEFD?=
 =?utf-8?B?WDA3eWoxU05uajRWN3FQM3NjRDczdW83SEowMzMyREYwUmRvV1h3SnRzdHgy?=
 =?utf-8?B?ODVrbzJMd0tWLy90WDh5Q1U1allkQ3BkQXNSSCtrWnBxZ2dFdjN4aXhLbFZa?=
 =?utf-8?B?UTZqZ2ZyeXZXU1RhV1dYMXpxR3hqRlgzZ04xck5Vdms0Unl5dDcyb3JVY3hz?=
 =?utf-8?B?WEFBZ3NoRUEvaEdVVERVdldmOWNNRE5QZXdSa1ZsNGd1STVmQkdnMnBXUWQ3?=
 =?utf-8?B?YU1IZGdFaW5yWnJ4VEFlMkRSR2tNbTUyZWNGNE5HbENoNXNzbXlwTFB1RTJJ?=
 =?utf-8?B?a0tSQXJESzBPaEJxWnA0NEZJMFNpNnBLeUZONFErbEJiL0V0Uk5GOFdiZnZJ?=
 =?utf-8?B?eEIzT09QMWhoa2V0R3lxZkNLblNhU0tPLzgwMXE5L1M3eW85Wml3N0xYNUNI?=
 =?utf-8?B?WTU4NUY3eGlMSkg5QndTRnM5ODcvMUxsdDV3OWpjS2xzamZaWXJ5dStIK2Nu?=
 =?utf-8?B?WFY4c0drUXFVOElhakNMWUtQOU9sVUk3dUU3aHpVSGRKU0k1ZU85Ri91VTNG?=
 =?utf-8?B?blE3V0dieitIMlFad0svaVZ6bCtaUmdYUFNtMVljOXNYSUFnYU9sWWZObStl?=
 =?utf-8?B?MWlXa0lpc2NLbElqY01jN0t6NjYrNE00eFVWTC8xa2Vqb3pQTUhPa2VWZzFL?=
 =?utf-8?B?SndlN0tnOFNQQU9aa1kxdlhGUTd4ckpJeUhmdmJOU0lOb3U4ODRFRjcvZno1?=
 =?utf-8?B?TzZVd09ickhjOWdPbUtqa1pRaW42bE5zVHpBQmdGOXdpMnQ1dFRma0FiY0xB?=
 =?utf-8?B?alhzK0tBWDFiUGFVTTZmSmVmZjl2Y3llZlo0WDU1RmFaeXVEZTFRTXNvOEJ5?=
 =?utf-8?B?a1BmTjlsNlF0MXFGeFFxV0d6cUVtM3FoWmltWmwxQk1oaEhJaVpnUFhzRXEv?=
 =?utf-8?B?Y04vZnY0R25XZW05aWNWMXZuWHBPNk5yUlRjR2U5aHF1bmc1Zm4weTc2MUl4?=
 =?utf-8?B?clRqdTVlZjVVRDA1c2EwNk9QZkc3Mlk2QU45YXE0VkhDcThTQ3ZmZHRZaVUr?=
 =?utf-8?B?V2JFTVFGYTVENEFhcTlFMk8rVXQzM2FHdmtwNjJUM2E0eGdPek9yaVN2STlj?=
 =?utf-8?B?OTJTVzBoQ2RUc0xnaGhUeUtJcElPY25KNm13elptcVc3cjFEYUxqZjAxbm1v?=
 =?utf-8?B?TUk4TzdIQzdFK3R0WmFoZitnQStlNTh6THdSNnVWMG4zNzdXUEJyRVhYQ2xl?=
 =?utf-8?B?RHJPS29DbEZKS0ljTXR4NFNUNXoycnpqN1lxZHNWRVBPbGU4c0s4NHN3ellj?=
 =?utf-8?B?MUNNR24wWThxRWFYck1XOXJOb214WndwSUVocTJzSTdERjkwYUlKbnNYb2hF?=
 =?utf-8?B?YlBqTy9SeVpNNkpnUGQ5VFc3ME1WR21ycmlLcDlzSnVXZFRVWXZwTDllZ1Y5?=
 =?utf-8?Q?MQVF3iG9iTrbUQK4=3D?=
X-Exchange-RoutingPolicyChecked: YY0dEFiua/dzNQjmRBwQhNI+zgAj56nqccaJz5k6sf55+yOgRryO2vOuaXnwpcpMLKYnCHQHwPyQgxbPHtZjQ7UVqIR7nCMKM3inDearWNn1CoqadG10kThiCTYNLkzLF49TADbMxX+39cpZ67wRmrWsJ7H56aAtCr5dpdOAWcYzNR2nVZwirESr8yMrob/pU3yn4BtZiygcOzobRG730b1JubvjmzvXm5rAeyLnejsn0w041fIRksj+X0ZFTB+gHqMj3mXQa/dJOq+DjLXtAj2PX1afNpEH4dTiafJbiL6qnqunITcHUG4YrDq0z0oTQO7mykYbIw0DEDhgaUA2vw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2211a131-3b8f-4754-0843-08df3aaf3d85
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 20:07:23.7203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCQ5w9WVvMnDZn6gz/wPb01Rp+1UVQIgeUdqHWbwo34cIyUhQv5TqvRpIod4afW5Ycbuqo1H3bdIE+avKVBWKypO4FeX4kbB7DulOO9c/L4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8167
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/4/2026 10:23 AM, Niranjana Vishwanathapura wrote:
> On Tue, Nov 03, 2026 at 07:51:48PM +0000, Jagmeet Randhawa wrote:
>> threads() hardcodes one worker thread per engine and N_EXEC_QUEUE exec
>> queues per worker. Subtests that need a different shape have no way 
>> to ask
>> for one.
>>
>> Pass the number of worker threads per engine and the number of exec 
>> queues
>> per worker as arguments, with the existing callers keeping the current
>> behaviour by passing 1 and N_EXEC_QUEUE.
>>
>> No functional change.
>>
>> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>
> Patch series missing cover-letter. Please add one in next revision.
Added in v4.
>
>> ---
>> tests/intel/xe_exec_threads.c | 71 +++++++++++++++++++----------------
>> 1 file changed, 39 insertions(+), 32 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_threads.c 
>> b/tests/intel/xe_exec_threads.c
>> index f03f20142..e7e472b4a 100644
>> --- a/tests/intel/xe_exec_threads.c
>> +++ b/tests/intel/xe_exec_threads.c
>> @@ -32,6 +32,7 @@
>> #include <string.h>
>>
>> #define MAX_N_EXEC_QUEUES    16
>> +#define N_EXEC_QUEUE        16
>> #define USERPTR        (0x1 << 0)
>> #define REBIND        (0x1 << 1)
>> #define INVALIDATE    (0x1 << 2)
>> @@ -1343,7 +1344,8 @@ static void *thread(void *data)
>>  *    multi-queue compute mode fd userptr invalidate race
>>  */
>>
>> -static void threads(int fd, int flags)
>> +static void threads(int fd, int flags, int n_threads_per_engine,
>> +            int n_exec_queues)
>> {
>>     struct thread_data *threads_data;
>>     struct drm_xe_engine_class_instance *hwe;
>> @@ -1351,7 +1353,7 @@ static void threads(int fd, int flags)
>>     uint64_t userptr = 0x00007000eadbe000;
>>     pthread_mutex_t mutex;
>>     pthread_cond_t cond;
>> -    int n_engines = 0, class;
>> +    int n_engines = 0, class, t;
>>     uint64_t i = 0;
>>     uint32_t vm_legacy_mode = 0, vm_compute_mode = 0;
>>     bool go = false;
>> @@ -1374,7 +1376,8 @@ static void threads(int fd, int flags)
>>             }
>>     }
>>
>> -    threads_data = calloc(n_engines, sizeof(*threads_data));
>> +    threads_data = calloc(n_engines * n_threads_per_engine,
>> +                  sizeof(*threads_data));
>>     igt_assert(threads_data);
>>
>>     pthread_mutex_init(&mutex, 0);
>> @@ -1387,34 +1390,37 @@ static void threads(int fd, int flags)
>>                            0);
>>     }
>>
>> -    xe_for_each_engine(fd, hwe) {
>> -        if ((flags & MULTI_QUEUE) && 
>> !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
>> -            continue;
>> -        threads_data[i].mutex = &mutex;
>> -        threads_data[i].cond = &cond;
>> +    for (t = 0; t < n_threads_per_engine; t++) {
>> +        xe_for_each_engine(fd, hwe) {
>> +            if ((flags & MULTI_QUEUE) &&
>> +                !xe_engine_class_supports_multi_queue(fd,
>> +                                  hwe->engine_class))
>> +                continue;
>
> It will look good if we reverse the loop order and add the 
> n_threads_per_engine
> loop here after the above 'continue'. That we we truely create 
> required number
> of threads per engine on which we will be running the job.
Done, the worker loop is now nested inside the engine walk, after the skip.
>
>> +            threads_data[i].mutex = &mutex;
>> +            threads_data[i].cond = &cond;
>> #define ADDRESS_SHIFT    39
>> -        threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
>> -        threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
>> -        threads_data[i].fd = fd;
>> -        threads_data[i].vm_legacy_mode = vm_legacy_mode;
>> -        threads_data[i].vm_compute_mode = vm_compute_mode;
>> -        threads_data[i].eci = hwe;
>> -#define N_EXEC_QUEUE    16
>> -        threads_data[i].n_exec_queue = N_EXEC_QUEUE;
>> +            threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
>> +            threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
>> +            threads_data[i].fd = fd;
>> +            threads_data[i].vm_legacy_mode = vm_legacy_mode;
>> +            threads_data[i].vm_compute_mode = vm_compute_mode;
>> +            threads_data[i].eci = hwe;
>> +            threads_data[i].n_exec_queue = N_EXEC_QUEUE;
>
> Still setting it to static value N_EXEC_QUEUE instead of dynamic 
> n_exec_queues.
Good catch, that was a real bug and the queue count never reached the 
workers.
With 16 queues instead of the requested 512 the many groups subtest stayed
within a single group, so it was not testing what it claimed. Fixed, and the
CGP_SYNC count for that subtest goes from 4608 to 16384 on NVL-P.
>
>
>> #define N_EXEC        1024
>> -        threads_data[i].n_exec = N_EXEC;
>> -        threads_data[i].flags = flags;
>> -        if (flags & MIXED_MODE) {
>> -            threads_data[i].flags &= ~MIXED_MODE;
>> -            if (i & 1)
>> -                threads_data[i].flags |= COMPUTE_MODE;
>> -        }
>> -        threads_data[i].go = &go;
>> +            threads_data[i].n_exec = N_EXEC;
>> +            threads_data[i].flags = flags;
>> +            if (flags & MIXED_MODE) {
>> +                threads_data[i].flags &= ~MIXED_MODE;
>> +                if (i & 1)
>> +                    threads_data[i].flags |= COMPUTE_MODE;
>> +            }
>> +            threads_data[i].go = &go;
>>
>> -        ++n_threads;
>> -        pthread_create(&threads_data[i].thread, 0, thread,
>> -                   &threads_data[i]);
>> -        ++i;
>> +            ++n_threads;
>> +            pthread_create(&threads_data[i].thread, 0, thread,
>> +                       &threads_data[i]);
>> +            ++i;
>> +        }
>>     }
>>
>>     if (flags & BALANCER) {
>> @@ -1448,7 +1454,7 @@ static void threads(int fd, int flags)
>>                     threads_data[i].vm_legacy_mode =
>>                         vm_legacy_mode;
>>                     threads_data[i].class = class;
>> -                    threads_data[i].n_exec_queue = N_EXEC_QUEUE;
>> +                    threads_data[i].n_exec_queue = n_exec_queues;
>>                     threads_data[i].n_exec = N_EXEC;
>>                     threads_data[i].flags = flags;
>>                     threads_data[i].flags &= ~BALANCER;
>
> This is the BALANCER loop and we are not applying n_threads_per_engine 
> here as
> it is not required. But we should add a assert in the beginning of 
> this function
> that n_threads_per_engine is always 1 if BALANCER flag is set.
>
> Niranjana
Added.
>
>> @@ -1471,7 +1477,7 @@ static void threads(int fd, int flags)
>>     pthread_cond_broadcast(&cond);
>>     pthread_mutex_unlock(&mutex);
>>
>> -    for (i = 0; i < n_engines; ++i)
>> +    for (i = 0; i < n_threads; ++i)
>>         pthread_join(threads_data[i].thread, NULL);
>>
>>     if (vm_legacy_mode)
>> @@ -1762,7 +1768,7 @@ int igt_main()
>>             if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
>>                 ignore_multi_queue_hang_warnings_in_dmesg();
>>
>> -            threads(fd, s->flags);
>> +            threads(fd, s->flags, 1, N_EXEC_QUEUE);
>>         }
>>     }
>>
>> @@ -1863,7 +1869,8 @@ int igt_main()
>>             atomic_store(&wq_stress_hang_detected, false);
>>             igt_until_timeout(WQ_STRESS_DURATION_SEC) {
>>                 threads(child_fd,
>> -                    REBIND | BIND_EXEC_QUEUE | WQ_STRESS);
>> +                    REBIND | BIND_EXEC_QUEUE | WQ_STRESS,
>> +                    1, N_EXEC_QUEUE);
>>                 if (atomic_load(&wq_stress_hang_detected))
>>                     break;
>>             }
>> -- 
>> 2.53.0
>>
