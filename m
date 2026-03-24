Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A763F532CE
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 04:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A7610E01F;
	Tue, 24 Mar 2026 04:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3UD7F8p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828B910E2E7
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 04:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774326864; x=1805862864;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=k+FPUPFcozq6pe3XqDa1ybM6CWaUa1j+3htXEJET5Io=;
 b=E3UD7F8p6gfuQC2zDpPdO5bFjN9RgcvQUQwQ7qfeVCOqjYmYMON6alzB
 ff2CrZqxa+IOli2ZHOJg0ePU5O8oIhauovoROlihSwUEp9fBtxOMM9XXw
 EfnAzKUPH+XIRUe9d5skZ9TFz91kbyaXp88HK2/7DW+mJ4F2FdTiGt+QR
 ckFYeeM/4jVjbTCiZNK1u1cqkny+TgZMW+NvAFIKzBGLOf4STFkdkHLEj
 E/+CN5dh1Mpc9mWm2OPUC1prLe9lD4PPTpbZO8wf89T9cbQNpSDwU0UiH
 qC5uAy2jy9K3A1JNv3zYugBwbv5gqv33e+xKVycuF4Wd0YMnF8wJ3FQph A==;
X-CSE-ConnectionGUID: fcAPG23rTxWUIzzHx+2fOA==
X-CSE-MsgGUID: x6TuZiW/RiGmRINg6/8cNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="79193387"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="79193387"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 21:34:23 -0700
X-CSE-ConnectionGUID: 6g6IMjJiQjCv0+vwYxtZDw==
X-CSE-MsgGUID: 9FfyLU2sT7Stsd0jgsn5hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="224207556"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 21:34:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 21:34:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 21:34:22 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 21:34:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEhDfWDC8vegKERl+LTGTujx/ZS3o9XKI3WiXogQP8Tc1CcA7rb/AMcbRsWDogeIONUra/Mwt35GzXZmdTLF7jkZ9THYTH5e9G1HPqDSB/dDxvlnmTS/Y9QbS/QjFQab+sXj9dKrfujh1o0WUnNzkqm4bcrRFixugueBI1iMLWAHjFBBqV3PHNNFShRii/ZGYI/hVKwdHcNUYwBuJTW656PATf9xlPqzRzzAccmyizPk8tB4gDOnjSDCIjlf+5rkRBKSnrDn/WhuAIQqAELsSjkvdrWxpb9NqXQcijovUmyMQrjHHSFiu0HJ9o1uvzWftQR/4XTcK4DUnhu+omhVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0s8BW7hI4D5068KYT7C/ofut6G4ceYgj962hOiGA24=;
 b=h4wiJGkRT5xrYLJr6xuXHNfaM5heoYgaedtw24ef6I19aXArySxLXuBYgJSuteAtJhcktGYGATPTJUm3YHdiU8+nGLkOrdmERwoXysPnage40uHHP57k+K1erxqPP13X5euSDfop7oPZq+Z8QEuNU7PPMU+QN/qW6wrWB59jJIVgiU+wdH6CCmgH1IfAsZpZ0d21UdchoDgHG2tsvSyH5QWMdUUjkABH+8zdT5ser5YTRtu1tv/tqdbeIzCBUIDk3UPSYkN6fKN3HtcZiQcFGb3yhW4l5BGQjHqzVSwcE5BbZmyW3SXxfFnVafdhO2QQfPtK0pFEBejz7h8CPYJ23A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 SA2PR11MB4873.namprd11.prod.outlook.com (2603:10b6:806:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 04:34:13 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 04:34:13 +0000
Message-ID: <27ec9076-a403-4f0e-866b-d7d5092ba19e@intel.com>
Date: Tue, 24 Mar 2026 10:04:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP status
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, John Harrison
 <John.Harrison@Igalia.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20260216184341.437722-1-John.Harrison@Igalia.com>
 <20260216184341.437722-2-John.Harrison@Igalia.com>
 <DM3PPF208195D8DAFED433B0156A8991F49E36DA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <852e3018-2ba2-4687-9794-49291636472d@Igalia.com>
 <20260224193044.vf5aauujilkcyth3@kamilkon-DESK.igk.intel.com>
 <8466ebfe-5d07-4330-b87f-d6757a65fadb@Igalia.com>
 <20260316190600.52rtxdxekh5dh6iw@kamilkon-DESK.igk.intel.com>
 <43c906e9-d9bf-432d-89a8-b734442a90f1@Igalia.com>
 <DM3PPF208195D8DEFB0B13D82E69455C33AE348A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <DM3PPF208195D8DEFB0B13D82E69455C33AE348A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::23) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|SA2PR11MB4873:EE_
X-MS-Office365-Filtering-Correlation-Id: 6961051c-756b-4e0f-4d36-08de895e99ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: B5mNTw0Xc1dcF97ser8u6gmZWM6h0M9qhvXRV7t3Wz/MoXo9xR6wDWaWuPmaMZZVvxWO+6X2l/R78TcYto9Wh7vId3rKaveCOe1wtEyuia3i2vyidHWSwBWtY4R1929XyPQxrDf2MlmmyqB9fOrD+Y5HL04XfzfelWSpRnrZKm1gHZLarqIHAIvpXPGLAN8OSV0q6JusSStBzSuGmkFmi/pGz9SWXqFzTbc1lwLy2suMStGtxCfVWgXxuTYn5Ts/XFrwwvP9Wsq2X+zV+x4IkoYf/7NbzhTbDGyMOJh51LdxnJJYpt1Hb6H9nSb6iaMPpPMTNfC44tkfmISatHh7EVosSE11YPFYHBn+lbm2vSfCPwWkEtOy9mam7Rb4K2lQSiuteHkie7h4kPgETICRIj1jHO0quHLMHdkPtg0E55fKpHDDiioaat2AYGjm/8RvUj9jwJxc0o3rsOv+IhseE+5vfzCjQQ01oINjcHN4bEJh8TlzGuJpwh9+sIgVRzqgp1Q4wFG90dwUCULiw/7X9uYAMjW6vh7zcKGdcWisShYkpx915r12ASHjvM1E8UfXZShLIarUOF0a+HSAufmrmVVb9LQIXaVYllzH2cDEd1t6lCYrCPuBvYYN8Zq5Fg17jJ7hIr3JoGOhnzojsUKb3I9uYbgEX/9sX5CFQxhnZRfRWb6hJBN/VpeiLpJf6uy7ymYQnK9ijw/9Lz8Ke2+E8DXWsTlYDBq6s4eEdxiPgQ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2hiS01KOHhRWk5xUHZRSGZFYWJQd1AxQXAxUmdjMzJraEpwcHBlSlYraWFt?=
 =?utf-8?B?MWF5eUJVVmdhZUFTSHB3RFB1UlZpZENSN1JDME5oTll3S1p4WlVwUE1Gb2t4?=
 =?utf-8?B?ZVNNcVlxYUVpRXVtTjJwcUR4Vmd0djJzcjllT3V3bnB6eTVCTXB3cGt1N3pH?=
 =?utf-8?B?cXdLTmlDeWFtSEU1ZmNWT3lZUGt3Vk1Sb0lSeVZ3QXF3RGZOU2VHZk9zOXR2?=
 =?utf-8?B?YWNETTV3a2lPVGVDQVRhUnJ5ZTlHWEErbWhOdkh4cExYeUJVRlNveXJTRHg3?=
 =?utf-8?B?cHo5VzN2YjVsRThMYktobTVKUFgvcHVXMzNRVG5LTGxVL0duVENFdDk2aXZn?=
 =?utf-8?B?b0tHNDBzU3J3WXNzckV1ek1tb1NDRE5ROWVFZW5ndXdsSy9BdHQ5QUJ1RE8x?=
 =?utf-8?B?TGVqUnhmZWdxcTZvNFBMUlM0L1ZHZnZ5cm9BVU1EU05mU21SRm9tcUt4VlIy?=
 =?utf-8?B?RVUrbzNOU2hPRUFGY0VJWUgvREw5RU0yZ3NNWS9NR1dxbEphMHZVN2JUQTUy?=
 =?utf-8?B?bkRYWnZ5WDBzbnBWUXQyaVpMUDdqdW9NR0JIc3N4KzdwekgyaUR4Y1BTSDR5?=
 =?utf-8?B?aG80Sm9QLzV6RXRYQWcrWmltaEkybTJka0NGcWllZnBwdDdzaWJTNkx0SXpl?=
 =?utf-8?B?dUNMOGlia0tBUjY1MzY2d0RnZzZSbEl0QTE3NUVPOUU4emNpUWd0M09nRTR0?=
 =?utf-8?B?V2dFY3JWVklJUm9ZMTBQcEVab21oTmFMOW1KdWJTQlJqb0RZZm9FR252NThX?=
 =?utf-8?B?cE5vTStqakhERkx4a2xGNzEvMlZpdXB3dVZNejhXa2NOeWtVeUdCQlYxZ1R0?=
 =?utf-8?B?RmozalNwQUMveVYrbmtNMjVxMEV1eFlUYW85ME5hUEV5THZHVjM2a2FLbDhp?=
 =?utf-8?B?SXZ5U3Nxb3VxOERjKzlKWGZFQkJ2ZmVMM29TQU4wTlV5R1o4U3Q0Y1VYempJ?=
 =?utf-8?B?OTVQYzBDZEtJeFNuZWc0cnh1di9RaEZyQVZaVm1tU1ZOMVNTU1p2b0Q4VTdn?=
 =?utf-8?B?eXNodTkyRXhwcFg3SFBVU1g3bEFXbFZjd0N4Vmp2bk5mNnNZUmtYdFNUSnhJ?=
 =?utf-8?B?ZEtqRk41c3VQNzFWUklNdTc4YzBaZkdnblUxLzM4N2dYcGR6ZWtQSmN2bmlI?=
 =?utf-8?B?WUxqNy8zSzRWNEhLTDB6Rk5HN3R2NkFyc2UxMm9QS2l2MTBvMUtCSVErOWxq?=
 =?utf-8?B?Z242dzcrTllYSEk2VmhodHExcU1QQ3BjV0ROS05mckpwcTVySkp2aFQ1YUFo?=
 =?utf-8?B?ZG1SYnZLbWkrSkZSVVBxS2hzOE1vMnE4MS8wTVJRVXNMWnU2Y21uZWVNSDgy?=
 =?utf-8?B?OThPbWx1QjBlZVQ2bGhQa2NyRDlmaFdsUU9CUTRweG10cXlSanpUcThOWTZM?=
 =?utf-8?B?K041RHBnTmtrNmt3eFRIcjRpQncvTEtZNENtQTZDc3BrMHFKbDdpekRtK3hG?=
 =?utf-8?B?V0s4SlFvMTArZ1RTOEEyd3lzS0dpbDFFRW1ra2ZFWXdqUkJ4dno1MFZWaVRv?=
 =?utf-8?B?ak92K2dKbm1IeGw1aThobFBWOWsxM21MazFvc1VJYUpFQVNWWWh3dFNLeG8r?=
 =?utf-8?B?d2ZyTUxTUjhYd1FTRDhmMlR6U2ZQSWhDUmlxQXJ1dUdZY0tWSGFBYStqRkty?=
 =?utf-8?B?UTh5bjgwRGR1Z2xTQm5iREdYY2RnMXFwbjBFeUIyUnVnYVJnbXR5cDJHNlB1?=
 =?utf-8?B?a2tUZlNiV0hjMTNUa2w0U0FxcjV0ZDFkL2RBM0dsdGNTMVlGMlE0RXhGWHl3?=
 =?utf-8?B?YWhGQmV3VWVNVUdJVStPT3JIUEVqYktKQmdBT200V2pGL1lvdVBxWG5DaFNj?=
 =?utf-8?B?VGZzTERxTDE5bkFkVU5XNUxkckRPWWlzMXRZd2J3d1VnZHl6QlFJVUtSLzEv?=
 =?utf-8?B?U0Fwdyt0Sm9DMW5ldGJScktUa0hkNDlSbW9lWDZDMnVnSVEzN2kvbDZCazFS?=
 =?utf-8?B?Q2xHTzVkNzB6RXpNQWwzSWl5d0ZCZFBSM0kyaWFoTFJWVGlrU2J3SHY0UG4y?=
 =?utf-8?B?ZWF0cUo0VVkzOWZWWUg4bTdtczNMUTYxK0JHb1FWK2JaUUI5WkRWcnVMV3dJ?=
 =?utf-8?B?OVJqRENORGdpZjBXVSt0c2RlR0w0eTFmNGlmQTFxYkM5ZWxOTW5PK1JkeXlv?=
 =?utf-8?B?TVM2MTBoSWpCYlIzZ3JPUE5tUEZpSzl1c1FnemdydktBSUphaGRGYm9pRUJq?=
 =?utf-8?B?a1NFRzdUVXk4aVR2NVE1aWZ6d2FYOS9nSFJpYWg5OG5HVGEwZjl3dFk4VE4w?=
 =?utf-8?B?R1pjN0w4Z3VwQXg1d1JGd1lCUWxRS3MxQnpIekRVN2Jua2pSQXZDSklidnBa?=
 =?utf-8?B?YVB5M3pQaE5VNXJNQmwyRU5Ba1N2b2FDbHVseDBtM3F1dWlUSGl1NnB2WG5k?=
 =?utf-8?Q?dO0XMvVi69VOXNFeqxE9AvfM05tHOUaX7bLFY?=
X-Exchange-RoutingPolicyChecked: rPzKrtODAhABgTV7wfnk+rO57cjfOioJZMnAfqqKSK5To9KUU5cLMxSU5BC3jRHkN76di1PQapn9ZlP4i/QT6czKhEYV1gaOL2ugm9Gn5ZBXJ3Sw5VrLFNgIphhZJeZ2qnsBBcuR5TP5GYN8P48pU+ioo8cYjjITMnrluAXk5BAG/a6EEj1M8Zy33XamytPvxw0q1OfKNeb7JaStvPRW+hElKhWqImBNs4eeVwMV6rkrxbksae5FotWujZf/uhCmGNLREM6Xc1yOzB2MW/vwp/f8XFrCvAOSgXSWlUik+4iL2bDLRNeT/dkI9lpLvSGy+Yatx24j7KQMRl57RZqbZw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6961051c-756b-4e0f-4d36-08de895e99ea
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 04:34:13.6565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCL4/J5utfKewrN0eVKgYkwoOJJXYIjFLgmMgX6ocPUKd49l29GWgvwqBEYmU9CLfLm+nBEW73a6Vlnmp/0UT4fhM6BHmobrRuhDUbUDIElTGh54ddzZX/qAtDopRqyQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4873
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

Hi Suraj,

On 24-03-2026 09:57, Kandpal, Suraj wrote:
>> Subject: Re: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP status
>>
>> @Suraj, ping?
>>
>> On 3/16/26 12:06, Kamil Konieczny wrote:
>>> Hi John,
>>> On 2026-02-24 at 14:31:51 -0800, John Harrison wrote:
>>>> On 2/24/26 11:30, Kamil Konieczny wrote:
>>>>> Hi John,
>>>>> On 2026-02-17 at 08:58:01 -0800, John Harrison wrote:
>>>>>> On 2/16/26 19:00, Kandpal, Suraj wrote:
>>>>>>>> Subject: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP
>>>>>>>> status
>>>>>>>>
>>>>>>>> The 'video player' showed what the requested HDCP mode was but
>>>>>>>> not the actual status. The menu system does redraw the screen
>>>>>>>> with a special colour to denote the status, but that is
>>>>>>>> immediately overwritten by the player thread. So all you get is a very
>> brief full screen flicker (to be fixed in next patch).
>>>>>>> So we do not want to refer to the next "patch" just mention what this
>> patch is doing.
>>>>>>> Also do not call it a "patch" since once it gets merged it becomes a
>> commit.
>>>>>> But this patch is part of a series and a series of tightly related
>>>>>> patches has always explained what is happening as a whole.
>>>>>> Otherwise, you effectively have this patch/commit saying "this is
>>>>>> totally broken and I'm not doing anything about it".
> 
> This comment still stands maybe misunderstood.
> I meant that in the commit message we do not say this " this patch does this ...."
> But something like "this commit ...." reason is when you merge it really is not a patch
> It becomes "commit" and you don't want to change the message when you are merging the series.
> Also when you want to refer to the to upcoming patches it needs to be referred as "upcoming/later commits."
> 
>>>>>>
>>>>>>>> Instead, add the current HDCP status as an extra text line of the
>>>>>>>> video player's output so it is permanently visible and clear.
>>>>>>>>
>>>>>>>> Also, move the enable of HDCP inside the mutex lock with the
>>>>>>>> internal state change. That way, the newly added 'enabled/desired'
>>>>>>>> line does not update in advance of the 'requested' line (due to
>>>>>>>> the video player thread being asynchronous and managing to turn
>>>>>>>> HDCP on while the menu thread is waiting on the mutex lock).
>>>>>>>> v2: Split into two patches (review feedback by Kamil)
>>>>>>> You can just write (Kamil) here
>>>>>>>
>>>>>>>> CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>>>>>>>> CC: Suraj Kandpal <suraj.kandpal@intel.com>
>>>>>>>> Signed-off-by: John Harrison <John.Harrison@Igalia.com>
>>>>>>>> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>>>>>> ---
>>>>>>>>      tools/intel_hdcp.c | 15 +++++++++++++--
>>>>>>>>      1 file changed, 13 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
>>>>>>>> cd5d2b6be..8e29c5e32
>>>>>>>> 100644
>>>>>>>> --- a/tools/intel_hdcp.c
>>>>>>>> +++ b/tools/intel_hdcp.c
>>>>>>>> @@ -482,6 +482,7 @@ static void *video_player_thread(void *arg)
>>>>>>>>      	char timer_str[32];
>>>>>>>>      	time_t current_time, elapsed;
>>>>>>>>      	int minutes, seconds;
>>>>>>>> +	const char *status = NULL;
>>>>>>>>
>>>>>>>>      	data = (data_t *)arg;
>>>>>>>>      	cur_type = data->hdcp_type;
>>>>>>>> @@ -502,6 +503,8 @@ static void *video_player_thread(void *arg)
>>>>>>>>      			prev_type = cur_type;
>>>>>>>>      		}
>>>>>>>>
>>>>>>>> +		status = get_hdcp_status(data, data-
>>> selected_connector);
>>>>>>>> +
>>>>>>>>      		switch (cur_type) {
>>>>>>>>      		case HDCP_TYPE_1_4:
>>>>>>>>      			bg_r = 0.0; bg_g = 0.7; bg_b = 0.0; @@ -544,10
>> +547,18 @@
>>>>>>>> static void *video_player_thread(void *arg)
>>>>>>>>      		cairo_show_text(cr, timer_str);
>>>>>>>>
>>>>>>>>      		/* Draw HDCP status above timer */
>>>>>>>> +		cairo_set_font_size(cr, font_size);
>>>>>>>> +		cairo_text_extents(cr, status, &ext);
>>>>>>>> +		x = data->width - ext.width - 20;
>>>>>>>> +		y = data->height - ext.height - 20;
>>>>>>>> +
>>>>>>>> +		cairo_move_to(cr, x, y);
>>>>>>>> +		cairo_show_text(cr, status);
>>>>>>>> +
>>>>>>>>      		cairo_set_font_size(cr, font_size);
>>>>>>>>      		cairo_text_extents(cr, hdcp_str, &ext);
>>>>>>>>      		x = data->width - ext.width - 20;
>>>>>>>> -		y = data->height - ext.height - 60;
>>>>>>>> +		y = data->height - ext.height - 120;
>>>>>>>>
>>>>>>>>      		cairo_move_to(cr, x, y);
>>>>>>>>      		cairo_show_text(cr, hdcp_str); @@ -605,8 +616,8 @@
>> static
>>>>>>>> void stop_video_player(data_t *data)
>>>>>>>>
>>>>>>>>      static void enable_hdcp_type(data_t *data, enum hdcp_type type)  {
>>>>>>>> -		set_hdcp_prop(data, CP_DESIRED, type, data-
>>>>>>>>> selected_connector);
>>>>>>>>      		pthread_mutex_lock(&data->lock);
>>>>>>>> +		set_hdcp_prop(data, CP_DESIRED, type, data-
>>>>>>>>> selected_connector);
>>>>>>> Move this change into its own patch logically a different change
>>>>>> But it is not a logically different change. As per the commit
>>>>>> description, the only reason for making this change is because the
>>>>>> video thread is now displaying the HDCP status. Without the display
>>>>>> of the status, it does not matter that the change occurs
>>>>>> asynchronously to that display (because there is nothing for it to
>>>>>> be asynchronous to). So splitting this out into a later patch means
>>>>>> this patch would be introducing a bug and the follow up patch
>>>>> Would it help if this change will be the first one in a series?
>>>>>
>>>>> If yes, then it should go first as a fix. If not, if this one change
>>>>> do not help in anything then imho it should stay in this one bigger
>>>>> change.
>>>> That's the thing, there is no reason for the set_hdcp_prop call to be
>>>> inside the mutex lock without adding the display of the HDCP status
>>>> to the video thread. Hence the reason it was previously not inside the lock.
>>>>
>>>> The lock is protecting the display thread. If the display thread does
>>>> not show HDCP status then changing the status asynchronously to that
>>>> thread is totally fine. But with the changes in this patch to add the
>>>> status to the display thread, having an asynchronous update does
>>>> cause 'flickering' of the display - the 'active' line changes before the
>> 'requested' line does.
>>>>
>>>> You could move the re-order into it's own private patch. But given
>>>> that it is always best to do the least amount of work inside a lock,
>>>> that patch would have to have a description of 'moving this because
>>>> of changes coming in the next commit'. Which is not ideal. Hence I
>>>> think it is better kept together with the rest of this patch.
>>>>
>>>> Thanks,
>>>> John.
>>> Sound reasonable. Suraj could you please ack or review this series?
>>> Does it improve this tool and works as intended?
>>>
> 
> Currently I am seeing some alignment issues when running the tool.
> Also there can be a better approach to fix the flicker. Ideally we targeted the type to only be set
> When HDCP is enabled but on revisiting the code that does not happen which is the root cause of the flicker issue.
> I want set_hdcp_prop type to have a data and status variable which it only changes in the mutex when it makes sure HDCP
> Has been enabled/disabled.
> 
> Then let the video player thread take the mutex read these variable and change the buffer color based on the actual status
> Green if enabled and red if disabled. We can have the status ENABLED DESIRED and UNDESIRED written on top not a fan of it but it would make things
> Clearer but not at the bottom right where the HDCP type is written.
> 
> Santhosh can work on it.

Sure, I will be working on this refactoring and fixing the issues on tool.
John , Can you please create a gitlab for this issue.

Regards,
Santhosh

> 
> Regards,
> Suraj Kandpal
>    
>>> Thanks in advance!
>>>
>>> Regards,
>>> Kamil
>>>
>>>>> Regards,
>>>>> Kamil
>>>>>
>>>>>> would need a 'Fixes' tag. Which is just pointless for the sake of a
>>>>>> one line delta. Or it could be a prior patch but then it would need
>>>>>> to say 'doing this thing that is pointless now but is required by a
>>>>>> future patch' and you have already said you don't like descriptions
>> referring to future changes.
>>>>>>
>>>>>> John.
>>>>>>
>>>>>>> Regards,
>>>>>>> Suraj Kandpal
>>>>>>>
>>>>>>>>      		data->hdcp_type = type;
>>>>>>>>      		data->video_start_time = time(NULL);
>>>>>>>>      		pthread_mutex_unlock(&data->lock);
>>>>>>>> --
>>>>>>>> 2.43.0
> 

