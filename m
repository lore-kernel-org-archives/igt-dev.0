Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C37606A31B
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 07:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HTy1RgR9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2611410E073;
	Fri, 23 Oct 2026 07:28:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F5110E073
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 07:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792740423; x=1824276423;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xuq01R1Yq18lJQXaJHX4pio12pWfFojTvgMRXMudQ1I=;
 b=HTy1RgR9KV5UAv8vI+Krm+NWOo7IENQtKMA0xDJF0YNDNndvSCV2GhIL
 9vHWywg5szCvLe5fRMNKLquZARGzX7JkyJyPRv7OiaPjutAf2gSyyqBfZ
 l804hllXThbcx9lZJuU/W4MMNrWeqsBbGP/ZmgcFU1KrzlTwtJqGPJPWb
 qKaGgXlvyqyg8aIeOyXUcF0DYk9IOB3im45910I4PS3ByaICAaSt/cdrC
 ocADgyllnPJgHBLNJN+FnmOJc2ASShZUlbP1utnfRGbfwSO/6a/1j5ZLt
 3XJOF5sTq6ExpjHwEHm880iIo0XGpydaHz/L10LtFDO6R1nr4Pfx3Y40Y w==;
X-CSE-ConnectionGUID: 0p4qqR3qTK29alb0NQbuMg==
X-CSE-MsgGUID: aOkwoqECQ5C3oAg4XpeRIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1388202"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1388202"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 00:27:02 -0700
X-CSE-ConnectionGUID: A2nU0l9yR/G0Ein3iUislw==
X-CSE-MsgGUID: IGDXGXl0Q1KoiYeVLaZq8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3945539"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 00:27:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 00:27:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 00:27:01 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 00:27:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYSie9Ajn0prMamuy0aow6wxXVoBOZsuTbLFTx2Pz9scZ5e+KZsJdROLFffSZD+R0L++28muFH0mIXIIib0nnusZ/8GUhCA4VMeB3Fva+Y5Uc5mEnj5KmjtNSb7FBF7t3LYwdDkAldYMaV53XZxPQIQQCO/I6CIjDQZM+ykW1kUpBHUMKjKUEusJL545/IeCfqtPEtYf85al2Z+dPDRhzV5iQ32dgG9i7ZUxac9uG93t8aKq6iHy+Gcvub4P6HjsNHRWIolFP5Ay+yupmnDn5mURQqLjZJMbb7bn8LgOolUdQBvaRe2i/cad/cJvHapRp0sMmQv1cJPHYO6KPw2FWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCDc7cXwrLqZ2401GtIW13P098BSc2ZSstRGqAB+2TI=;
 b=b943OBr5ynOJ2l4kO2yY3bVUpUNigG/ihdEGXYCOufUx5TPdRuglJTVkEl6AmPqdK2l9wGe7+IGvGUFaTWR+kQZA1jWuU7YyGMtX+YXUwSEW7nOw6qV7ZyI3befwAfSJuohQruc4vYcozw7AtvREq2ifMqG6q1nH65P5Zr24gdlA2gi2JUs6v1B+X+HuGojvIBDgQ85Qp4tC0VJZniYvBdOh0gDJysdPL1JOVYeB4XAx9ZjEjl2YjbGzOBmv2tt4K9ly8dgXGhLmmLt1Z+AXqjm6WkkKINM71X0v04zwmFuVdSRpuEi3xH3D4/9DJVv1hise1xrhJ6ai4xlwU511Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 07:26:59 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 07:26:59 +0000
Message-ID: <0e9ce92e-2519-40e8-968b-ec45d7444732@intel.com>
Date: Fri, 23 Oct 2026 12:56:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] lib/igt_drm_netlink: add event notify
 subscription and event wait support
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Raag Jadav <raag.jadav@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
 <20261013190651.897241-9-ravi.kishore.koppuravuri@intel.com>
 <5bd1bcf1-31a9-4dd0-bb32-5f6cf18e5f5b@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <5bd1bcf1-31a9-4dd0-bb32-5f6cf18e5f5b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0147.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::9) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|PH7PR11MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 90eb5eb3-32f3-4c58-f814-08df30d70607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|261022105027099003|261022075727099003|56012099006|11063799006|4143699003|261021135927099003|261009223027099003|261021123027099003|261021121427099003|10067099003|18002099003|22082099003|6133799003|3023799007|261022113327099003;
X-Microsoft-Antispam-Message-Info: fnpn4/Hz4BlVXzv+4vo4E1Rg2jkgZyFIC+tU0aJxex7GWIxbkKAaoiK+CnMhl3vytPKW1Jp3yUvFWoKMKCZAl/Eu8TDaWoWIrasry86goI9c/9AX4D6OlQh88Zec+hd+NeinwR4PBT1VeZBUBExwNObF9VIyaG2Tmvn1qjNThCkLV6VJiQXGJ+3c8HnWtrkqOjssr1Td3MP7o6egQr5xCY/5TFGl4/zPRWPp5kV5HALzwUTQWeWBveJy8nSCEHibZHt3v2PKtZITjtb4nD1X98Qht6BY2DQS+VPMEg0zY2kx2za4g+qYBSWhZ3CKXpVnohHo+aNzqLKgLWjIl0v+twpiHcHfdXRjdyw8UrRPTAX4ef9uwfBzQuq1NjDt9TjEHp+R82ntE+oL9vthxd0XMWQVq2vZbDK7mVR7whQqNh+oGzZ7FyOuAykMzb30sZf3afvS3xLMQPlxTl0WfwMu517CutDhAphCLdKYPD6wMIj3bIigbFrc5a4vmYg+vSJGa/hi4xAlMAIT8SInlaH7vrVpIyi0lZ9Q4zQ5SUjziDaF+ofJ9mutUk74DL0Ps9g05aJ+9EN5TX9MyOK8K8gogeXk3IA7K1DJvxaRF9PrWT7ReOl8IhUYfZZtx0YmghZa+xvp5/xNDBtsoQ8TAMKPkRn3zbz4s1mYtfrUps0xIxw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261022105027099003)(261022075727099003)(56012099006)(11063799006)(4143699003)(261021135927099003)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007)(261022113327099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVYvKzU5NU1GWXZkTlppM3FFUEVDbEloajBCeWpQWG5EUkpHU2hzT0JlYnJQ?=
 =?utf-8?B?eUdiU29wTzF0aCtpTzMxcEVqWS95R2dFcHN4TGtjYzhjNkdGelYrUkNLdGU3?=
 =?utf-8?B?dVl5Zk0rMjB4RWtCSU5kZWNiQVAzeURkb0lDVnZhZHFjREdmb0haQU52Y2I0?=
 =?utf-8?B?QlBMdTJxVG8wMzFsUmFYOFJYSTc0ZjdzcnBzZjZkNVhSeWNoUURDLzVvUXBW?=
 =?utf-8?B?OUJYKzNpQzAzZTNsMUVYMFJ5RFFjeUxUZnJEdkZhTWtYcnFsMFk4Mi9ZVERZ?=
 =?utf-8?B?WFV1NWdCM2kyTkJtTkxCUkdXaVYwY0p6cFc5cWpTdThuclRBdHNGNU5TOVdz?=
 =?utf-8?B?dzhqNzZXcnBLR1A2Q0JQcVhzVzg3R3J6clJ3bUlZU1F5bzBrNWYwTkxwV20r?=
 =?utf-8?B?RHNCTnUvSXRPbjVNWml5WlhnWWJzVHJ0QTlGTGtSTTA1dEs3TVVWelNrbWEz?=
 =?utf-8?B?cnB5YVFOU0ZNUmdQa2NDaFpYYkF5THNVaTlISms3MHdwUkkvL0YxUlY1RFB5?=
 =?utf-8?B?SmVUM2FxSHMrTFFsTG00RW5pSWRhNVNLeGJCbkhtSkdVdjVrRkJCTFU4aVNF?=
 =?utf-8?B?R2ZUT2RiM0l0MzJWWjhneWxYQ0ltajh5bjlnK3dnSEZzUkdkTzdPL1F5MzVZ?=
 =?utf-8?B?SktxMHgxM1lKbm1jMEJEU3Z0T0JobTNYczhrbWl1YUhVMTRNZDA0SWVXUzFQ?=
 =?utf-8?B?RDZ1dkJ5UUJuR0s1dVJCUEVybnowQTlvcTBSQ0lZSWUzbmdGZjFHRmJ4OUhW?=
 =?utf-8?B?dkxpZXh4S3Z1VXdlSzNBVkp3OGNvdlVzYU9qeWxYcnVsY0k2ZzlzaHc4MjI1?=
 =?utf-8?B?UkdseWpMSlhoeUUyaytkdGhYY0ZUbmY0ZGkyOEdMT0xFbUM5cThIU2hKblEz?=
 =?utf-8?B?V0wrUVFpZU1LWUg3bGJ5VHVpSGZPSTV6VHRhaUlIMDN1SnF4enNadklSRHFP?=
 =?utf-8?B?dkRXY05HaEtLb3M2UU5wdmJNbDNzRE5Zc2o1VXdnaTZWUkNINkxDa1VaSTU5?=
 =?utf-8?B?KzhwbloyNXRFRjd0ZmVpdlluNzN5TjlLdUlMTXNnem83Rzc4ekZWQVhvZERw?=
 =?utf-8?B?bUk2ZjROODhPUit1cmNvUVZDNnFuZzF1WVh3aVJTeE1XVmo0TkZQWFVjTGtH?=
 =?utf-8?B?dTZvZEhZcDhUZEdCU2lJZXExNS95d3dpc0ZQSU4rd0w3UTgxQ0ZUSmRuNlRN?=
 =?utf-8?B?N2pYQXJpMWNOaVdielh0aytDQ3JzT3NWbW1EWU1aNXIrK29IK3k3NEczU2xU?=
 =?utf-8?B?T3UwNUFKNFNGSFYyTTd0TURRRW1yaFhDZU9Vd3dBOFJDcXlrWWJTM002aEpE?=
 =?utf-8?B?VXVOZU9HZDhPM0s2ME82NGo5djVLajh0UnB5dWt5WUFhRWx3VEN2Q0x2a2dB?=
 =?utf-8?B?ZVJmWUhobGNEbktkYzJIeWNoZGt4TkZTbFcvdWdGZTRxYkFKcDF3a1BZcURF?=
 =?utf-8?B?VGxUTWcvTDA1Y1k0T0xkT2p1KysvcitaenpqbWpBUDRsQ0pEUm1qeUlaUGk5?=
 =?utf-8?B?Z2VMM08wVkllTHN6c2JwcjlWZGFCWkVQVkNtNE4rTldzSU9Bbm04dE1Yb2sy?=
 =?utf-8?B?VVROdnNBUVJvUnhTTWJRcUx1RzZIQXBRUUp4T01sa2xjS2VpQWFxN0tjT1ZK?=
 =?utf-8?B?VmQ4Nk1JWGRXbFRzcmhYcDl0VDVLRkpaL2dNWGg1K1JYV1dSemlucWpJVlRE?=
 =?utf-8?B?K1RFdmpzVjE4cm9pRW9USEdYMk9wYmg0WDZqeTIybTdFMWFNelMxWVhTUHcy?=
 =?utf-8?B?YUdkbEJIUDd4TWVGcVUvbEpMQzZaTjFzY1RuZ0lqbDVuRzUxYmJIeGU0UzB3?=
 =?utf-8?B?Zk1IM0h2clVXdU8xMG9kbHl5TERmU0FIOERDeHdBOWZVVkxWaHRyNVpJSk1J?=
 =?utf-8?B?MHpYUmN6NnQvYUtXN2t0SldCREp5SGpGNmI3OGVyY2RXOVJmTkdmMVZWaytm?=
 =?utf-8?B?ZXdtcCtJNHJmVnRjZEpnUW1lUE13SEtlbUhXY2Jzcm8raTRUVHB3eHAzQnFD?=
 =?utf-8?B?bzlpMERVN2FiMklUNGxaelg0S242bnJhUDBnaUZZd3U2YmZvWlJpbGd3Uk4r?=
 =?utf-8?B?UVcwdk1MSVZlNjBleFNkbFNjcGdzOTlwL1A2Y2ZndGlxdDNrNVJmUE5wYzBl?=
 =?utf-8?B?RlBGSkU3a25LUGEzSWdzTTJKU09haFIzeEtFZWxpckx1N2pIRExpWG5CakF4?=
 =?utf-8?B?UUI3cXZ2LzBTZWJsbG85b0JneEhKQTVaUWlZTVZZay8rQmhjdDRxTktWU2VR?=
 =?utf-8?B?dUdIM1pXcERmdVpZeUJGRnZIN3ZyMlNwYlZUdTVyQ1JlK1ZGZFVmWHRRMG1L?=
 =?utf-8?B?QjluZE5WTXgrSnZQYWYyZjlHb0l4WUR2ekVyZkdJS3hNNzB6cVh2Zm1XUzR5?=
 =?utf-8?Q?R0Ssc7zTJquOEwtv9gVUuEf7qUmD8a6Tcmp/k?=
X-Exchange-RoutingPolicyChecked: IeOZWicwECAlu2MJ8yxMFoIWROKOmLTe5JVMT/XlhUUQzpJSmlDsLd1UT89STGRuwqCvJyVyPImeUV0x5uxxg3Vz3WzOEpBTqUe+8y+oaHzMQYW3GSy6RZkDQSSJpof2uKDXGL545UZoN/VQIVkzPMvAbsrj1KAq8iXaYEQx2l/BkONRjcLpP7v3p3zMSJnggKKgfmnbKH0blYy1TEbdqQIwHoLLyWKLxfWnmKgu1IUW8MgQ8WCqtVCnXLPIMHlnhl6gdszsPomY9ZEmux0XbhKIDatX4e1EtA/8FRjzfmBEEcJNNG3YYdgrWdblph1M9CoY44iNnye6o7p9CxEvVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 90eb5eb3-32f3-4c58-f814-08df30d70607
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 07:26:58.9230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qZ3LxMtTx6Az5W2sJ/Azh74aj4thgSHqKrqshqGtlYpi5OX5IAB/DMbkNuiSFEGmhrrI6oGZEzAOWS8o9zV4kV3v8MkMyOLjRR6AIlLt8kKkLYZvjiqpATH6rAWJoTh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6978
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

Hi Soham,

On 23-10-2026 01:01, Purkait, Soham wrote:
> Hi Ravi,
>
> On 14-10-2026 00:36, Ravi Kishore Koppuravuri wrote:
>> Added event notification support with subscribe for an error-notify 
>> event
>> and wait for the event notification functionalities.
>>
>> Cc: Soham Purkait <soham.purkait@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Cc: Raag Jadav <raag.jadav@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Cc: Harish Chegondi <harish.chegondi@intel.com>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>> v5:Added a guard to prevent duplicate multicast group subscriptions 
>> (Soham)
>> v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
>>     Jani & Kamil)
>>     updated error event name from error-notify to error-report to align
>>     with the latest changes in drm-uapi/drm_ras.h
>> v2:Handled SEQ_CHECK nl response using separate callback
>>     Added monotonic-clock deadline to wait for messages without 
>> exceeding the
>>     caller’s total timeout.
>>     Added support to receive events until it sees an event whose node 
>> ID and
>>     error ID match the requested values.
>> ---
>>   lib/igt_drm_ras_nl.c | 182 +++++++++++++++++++++++++++++++++++++++++--
>>   lib/igt_drm_ras_nl.h |  18 +++++
>>   2 files changed, 193 insertions(+), 7 deletions(-)
>>
>> diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
>> index 94fcc40ac..c5f1a1a3f 100644
>> --- a/lib/igt_drm_ras_nl.c
>> +++ b/lib/igt_drm_ras_nl.c
>> @@ -6,6 +6,7 @@
>>   #include <errno.h>
>>   #include <poll.h>
>>   #include <stdint.h>
>> +#include <time.h>
>>     #include <netlink/errno.h>
>>   #include <netlink/genl/ctrl.h>
>> @@ -62,10 +63,12 @@ static int ras_command_cb(struct nl_msg *msg, 
>> void *arg)
>>       nlh = nlmsg_hdr(msg);
>>       gnlh = nlmsg_data(nlh);
>>   -    ret = genlmsg_parse(nlh, 0, attrs,
>> -                DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
>> -    if (ret < 0)
>> -        return NL_SKIP;
>> +    if (gnlh->cmd != DRM_RAS_CMD_ERROR_EVENT) {
>> +        ret = genlmsg_parse(nlh, 0, attrs,
>> +                    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
>> +        if (ret < 0)
>> +            return NL_SKIP;
>> +    }
>>         switch (gnlh->cmd) {
>>       case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
>> @@ -85,17 +88,47 @@ static int ras_command_cb(struct nl_msg *msg, 
>> void *arg)
>> nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
>>           break;
>>       }
>> +    case DRM_RAS_CMD_ERROR_EVENT: {
>> +        struct nlattr *event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_MAX + 
>> 1];
> Please declare event_attrs with the other local variables at the start 
> of ras_command_cb(). Could the existing attrs array be reused ? 
> Although in that case, the shared array would need to accommodate the 
> larger of the two *_ATTRS_MAX values.
>
> Regards,
> Soham

I have separated the struct nlattr * for DRM_RAS_A_ERROR_EVENT_ATTRS_MAX 
and DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX to avoid the confusion to readers. 
And event_attrs pointer is made local to the ERROR_EVENT switch case to 
avoid pointer definition for all other commands. So, the current 
approach also looks good to me.

Thanks,

Ravi Kishore K.

>> +
>> +        ret = genlmsg_parse(nlh, 0, event_attrs,
>> +                    DRM_RAS_A_ERROR_EVENT_ATTRS_MAX, NULL);
>> +        if (ret < 0)
>> +            return NL_SKIP;
>> +
>> +        if (!event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID] ||
>> +            !event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID] ||
>> + !event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE])
>> +            return NL_SKIP;
>> +
>> +        ctx->event_node_id =
>> + nla_get_u32(event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID]);
>> +        ctx->event_error_id =
>> + nla_get_u32(event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID]);
>> +        ctx->event_error_value =
>> + nla_get_u32(event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE]);
>> +        ctx->event_received = ctx->event_node_id == ctx->node_id &&
>> +                      ctx->event_error_id == ctx->error_id;
>> +        break;
>> +    }
>>       default:
>>           return NL_SKIP;
>>       }
>>   -    ctx->reply_received = true;
>> -    if (ctx->ack_received)
>> -        ctx->cmd_done = true;
>> +    if (gnlh->cmd != DRM_RAS_CMD_ERROR_EVENT) {
>> +        ctx->reply_received = true;
>> +        if (ctx->ack_received)
>> +            ctx->cmd_done = true;
>> +    }
>>         return NL_OK;
>>   }
>>   +static int ras_multicast_seq_check_cb(struct nl_msg *msg, void *arg)
>> +{
>> +    return NL_OK;
>> +}
>> +
>>   static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr 
>> *err, void *arg)
>>   {
>>       struct igt_drm_ras_nl_context *ctx = arg;
>> @@ -157,6 +190,27 @@ static int register_callbacks(struct nl_cb *cb, 
>> struct igt_drm_ras_nl_context *c
>>       return 0;
>>   }
>>   +static int register_multicast_callbacks(struct nl_cb *cb,
>> +                    struct igt_drm_ras_nl_context *ctx)
>> +{
>> +    int ret;
>> +
>> +    ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, 
>> ctx);
>> +    if (ret < 0) {
>> +        igt_warn("Failed to set NL_CB_VALID callback (ret=%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = nl_cb_set(cb, NL_CB_SEQ_CHECK, NL_CB_CUSTOM,
>> +            ras_multicast_seq_check_cb, ctx);
>> +    if (ret < 0) {
>> +        igt_warn("Failed to set NL_CB_SEQ_CHECK callback 
>> (ret=%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int send_and_recv_nl_msg(struct igt_drm_ras_nl_context *ctx,
>>                   struct nl_cb *cb,
>>                   struct nl_msg *msg)
>> @@ -299,7 +353,12 @@ static void reset_drm_ras_nl_context(struct 
>> igt_drm_ras_nl_context *ctx)
>>       ctx->ack_received = false;
>>       ctx->response_required = false;
>>       ctx->error_threshold = 0;
>> +    ctx->event_node_id = UINT32_MAX;
>> +    ctx->event_error_id = UINT32_MAX;
>> +    ctx->event_error_value = 0;
>> +    ctx->event_received = false;
>>       ctx->family_id = -1;
>> +    ctx->subscribed_grp_id = -1;
>>   }
>>     void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
>> @@ -440,3 +499,112 @@ int igt_drm_ras_nl_set_error_threshold(struct 
>> igt_drm_ras_nl_context *ctx)
>>         return 0;
>>   }
>> +
>> +int igt_drm_ras_nl_subscribe_error_report(struct 
>> igt_drm_ras_nl_context *ctx,
>> +                      const char *notify_group_name)
>> +{
>> +    int grp_id;
>> +    int ret;
>> +
>> +    if (!ctx || !ctx->sock || ctx->family_id < 0 ||
>> +        !notify_group_name || notify_group_name[0] == '\0')
>> +        return -EINVAL;
>> +
>> +    grp_id = genl_ctrl_resolve_grp(ctx->sock,
>> +                       DRM_RAS_FAMILY_NAME,
>> +                       notify_group_name);
>> +    if (grp_id < 0)
>> +        return grp_id;
>> +
>> +    /* Check if already subscribed to the requested multicast group */
>> +    if (ctx->subscribed_grp_id == grp_id) {
>> +        igt_debug("Already subscribed to DRM RAS multicast group 
>> '%s' (id=%d).\n",
>> +              notify_group_name, grp_id);
>> +        return 0;
>> +    }
>> +
>> +    ret = nl_socket_add_membership(ctx->sock, grp_id);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ctx->subscribed_grp_id = grp_id;
>> +
>> +    igt_debug("Subscribed to DRM RAS multicast group '%s' (id=%d).\n",
>> +          notify_group_name, grp_id);
>> +
>> +    return 0;
>> +}
>> +
>> +int igt_drm_ras_nl_wait_for_error_report_event(struct 
>> igt_drm_ras_nl_context *ctx,
>> +                           int timeout_ms)
>> +{
>> +    struct nl_cb *cb;
>> +    struct pollfd pfd;
>> +    struct timespec start, now;
>> +    int remaining_ms;
>> +    int ret;
>> +
>> +    if (!ctx || !ctx->sock || ctx->family_id < 0)
>> +        return -EINVAL;
>> +
>> +    if (timeout_ms < -1)
>> +        return -EINVAL;
>> +
>> +    cb = nl_cb_alloc(NL_CB_DEFAULT);
>> +    if (!cb)
>> +        return -ENOMEM;
>> +
>> +    ret = register_multicast_callbacks(cb, ctx);
>> +    if (ret < 0) {
>> +        nl_cb_put(cb);
>> +        return ret;
>> +    }
>> +
>> +    ctx->event_received = false;
>> +    clock_gettime(CLOCK_MONOTONIC, &start);
>> +
>> +    pfd.fd = nl_socket_get_fd(ctx->sock);
>> +    pfd.events = POLLIN;
>> +    pfd.revents = 0;
>> +
>> +    while (!ctx->event_received) {
>> +        if (timeout_ms == -1) {
>> +            remaining_ms = -1;
>> +        } else {
>> +            clock_gettime(CLOCK_MONOTONIC, &now);
>> +            remaining_ms = timeout_ms -
>> +                       (int)((now.tv_sec - start.tv_sec) * 1000 +
>> +                       (now.tv_nsec - start.tv_nsec) / 1000000);
>> +            if (remaining_ms <= 0) {
>> +                ret = -ETIMEDOUT;
>> +                break;
>> +            }
>> +        }
>> +
>> +        ret = poll(&pfd, 1, remaining_ms);
>> +        if (ret == 0) {
>> +            ret = -ETIMEDOUT;
>> +            break;
>> +        }
>> +
>> +        if (ret < 0) {
>> +            ret = -errno;
>> +            break;
>> +        }
>> +
>> +        ret = nl_recvmsgs(ctx->sock, cb);
>> +        if (ret < 0)
>> +            break;
>> +    }
>> +    nl_cb_put(cb);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    if (!ctx->event_received)
>> +        return -ENOMSG;
>> +
>> +    igt_debug("Received error-notify event: node_id=%u error_id=%u 
>> value=%u\n",
>> +          ctx->event_node_id, ctx->event_error_id, 
>> ctx->event_error_value);
>> +
>> +    return 0;
>> +}
>> diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
>> index 5c9be5b17..057c6026f 100644
>> --- a/lib/igt_drm_ras_nl.h
>> +++ b/lib/igt_drm_ras_nl.h
>> @@ -47,6 +47,21 @@ struct igt_drm_ras_nl_context {
>>         /** @error_threshold: Error threshold value to query/set */
>>       uint32_t error_threshold;
>> +
>> +    /** @event_node_id: RAS node ID reported by an error-report 
>> event */
>> +    uint32_t event_node_id;
>> +
>> +    /** @event_error_id: RAS error ID reported by an error-report 
>> event */
>> +    uint32_t event_error_id;
>> +
>> +    /** @event_error_value: Error counter value reported by an 
>> error-report event */
>> +    uint32_t event_error_value;
>> +
>> +    /** @event_received: Set when a matching error-report event has 
>> been received */
>> +    bool event_received;
>> +
>> +    /** @subscribed_grp_id: Multicast group ID currently subscribed 
>> to, or -1 if none */
>> +    int subscribed_grp_id;
>>   };
>>     void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
>> @@ -54,6 +69,9 @@ int igt_drm_ras_nl_init(struct 
>> igt_drm_ras_nl_context *ctx);
>>   int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context 
>> *ctx);
>>   int igt_drm_ras_nl_get_error_threshold(struct 
>> igt_drm_ras_nl_context *ctx);
>>   int igt_drm_ras_nl_set_error_threshold(struct 
>> igt_drm_ras_nl_context *ctx);
>> +int igt_drm_ras_nl_subscribe_error_report(struct 
>> igt_drm_ras_nl_context *ctx,
>> +                      const char *notify_group_name);
>> +int igt_drm_ras_nl_wait_for_error_report_event(struct 
>> igt_drm_ras_nl_context *ctx, int timeout_ms);
>>     #endif /* IGT_DRM_RAS_NL_H */
