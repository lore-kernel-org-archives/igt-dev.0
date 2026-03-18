Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2408F107BCF2
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 10:38:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C8C10E7B5;
	Wed, 18 Mar 2026 10:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4UoS4qu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B86010E7B5
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 10:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773830308; x=1805366308;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZyXa+aU8VTfW+nmIdSsEBROrsMkpxssbkQM5i7TZwgo=;
 b=i4UoS4quZVGDAfC2J0eXUvxOCg5blwJ4TbkQ2nEscwu9TLOjHl5kXwM9
 6u1kvdi3xbjo1R5ktmaJQ3SHQjmzGzOD5gK1WyDSyX/mMCeQHcxwx5xYN
 MOvs8CBVJeA/ZViagglz9VyXVBCaTlVhLVuzFp4WQ0mrLedY+sC+YOJQj
 /FYyGXxPsmIrlBlOhkdC2n14HDdUoJ/W9o/qxDwZcuHf7soFyAC9URxNF
 Q5BQLS1n6Wttuihx1rfbUz68o2lPEfUq6unP5d7XxchMJ5VYf/7G1fIFK
 3vh1XZGaYLopKQcgbSNG7+BK4BY5R1sDlFzNRJTW+dIDrzHxh5W922oNA Q==;
X-CSE-ConnectionGUID: WFlaHdlsTrODvBmzgm6ALw==
X-CSE-MsgGUID: IYZQAEGCSBmFy6uWwtzXTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="100340612"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="100340612"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 03:38:27 -0700
X-CSE-ConnectionGUID: CefQIiPGR1mz99X3srZBHQ==
X-CSE-MsgGUID: sMJq965tTU+ExLCdirphTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="220033182"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 03:38:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 03:38:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 03:38:27 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 03:38:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+bh/c7sOjQzMiE5pyF1Hy6Kp/nXnPPWWga8tM83Y9Pp0HXAks+K9xZmiFmOe354TXuez+cnDfvvwf7HGovDmPOt16wZSc+cFxrpRL4L32IXf98uzpG5KqFLTiTjKA4Nj2jmgB7TPRZSVuEwvZjcbDwmjfoNMHsAKYzMwQ/l1EJMwwc1CYMsr0lZ6h3O0vVNOwAlGdxJTPSuaTAC/3VIqHHTW4Fk1ECF/sGV2wc2ZFd4oUAdCfY+KpIDtWHlu5noYDyQJ5QEIDuv70WPZapisPlkAZzRO5/f/5gaZ9KrtNyUI5W90ASmSS6yIVfeSfAIgdTobC5SCU86KRXSSLqP8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Viru6nWo8LxYBUD8fNwb1A+ZehR//R/dfz1vxutmkQ=;
 b=IOLsEjDINh80a8ypIwklBDSBxBDm8v4kISQ3tccSgPVTwuDUAn5yeVFtIWjTFrLS+rlSN1PHoSBZPuO4wzxPIwhgrXyrmq0ff3iYycctyjEsk/fDlBEW03OhMu/vEkp//aPW+/BAtWCKNMZ4WsJBw5CNAbRFM6kkULZEDv4Nn9vBO5mBCvdBFsZTYXxZlgGCS/F9nyG1xU8pWA5RYTAZLZcsBTAmjY063Sqf0dAa4G1TWRHG2yoB/cyx/joGGgIolNOo3cKAZhQ5ArfD7Fd0wIfjnQ3alHmsHIbZMVBClRbaKNc6E+6njyUoxN/444x1KrUMYT79wuYI94a0KQRGFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by SA3PR11MB7627.namprd11.prod.outlook.com (2603:10b6:806:320::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 10:38:24 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 10:38:23 +0000
Message-ID: <4aa9735d-51f6-4e6d-94f3-40d467d5f7b2@intel.com>
Date: Wed, 18 Mar 2026 16:08:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] lib/igt_psr: Fix Early Transport status handling
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
References: <20260226094251.3986123-1-ramanaidu.naladala@intel.com>
 <20260317193058.722290-1-ramanaidu.naladala@intel.com>
 <645964eee31a4df3c4fb1cf844f07e8bd9352424.camel@intel.com>
 <80257ff3-e7de-4c04-bc97-bdd6b51147fd@intel.com>
 <6b4f9517742b08833573ff5e2f86d5eff93a5918.camel@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <6b4f9517742b08833573ff5e2f86d5eff93a5918.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To BY5PR11MB4260.namprd11.prod.outlook.com
 (2603:10b6:a03:1ba::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|SA3PR11MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e372e78-a432-41d7-cc1e-08de84da7b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 83zJUnINuGKQ6o6DlguxTIQ97KulJyugTd87KWo6SStvbsc7Q7skfNxNFH9R63oHkv62BJJ0ziyDwW5XA0wl/5xwPQUlqN5xZKyGcpcondoUzFMhr/fc75Imw14wV1Eem1tcTTPLkuCDlDDXRPo5ESg9KZuK1yJYOgp/zkLN8Tm8D/1ms3no+46WSoQ4Ri43bkN5mMcEmoVyXh/sWpq6OsMPym2iKmjd6t+ATNOCIaUJT7p7ltv2KQ2AMgyG9Vn2HgLEKWiAE+Nk/COj9dXzWcJ4oVbBGNXJmplsgOyxTLrgYN/OvKtmiOMvG7dTblVA2R9WkIpJ6gzFR43ZXAb4ncTu3jkqcSIZWMY+5bAPUhHoSs/LEZLMI4snvtypalh+C5C9TTrTvRkaTOOen6NgHlnDFYwCVVNmXJl7XfH5XSx8n/29IPVjqwp3QVJfluKsOZUJGdAtBehnyRLR7iiWgghdoMVfFj4tsbVJSawlrFgdIFdcd2810V7R5VQOaHXqyAR+19r9h7QmN0apBCOiouHjpoYskhlFracEUDQiElHn2cR/8j1R9mV3AvJhiNpnG7SMUb+k7co91eQlehN7lm+JBr5Ay13MGcHVO0ZkPuBhx1ZgblZKb9Hb0eWBBU96lOG/PYOSePFam2lZCaMi1tRJ+UH/aM+JFxoFc6RK04JGP0FgNl96GCXc6MSCWODlJmlYVQVCjuydTdA4bT3FOxkEiSnE0rIqAkoxSoQrqIHcJYX0L1kIweGy33q96tjW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TENWRjJlZys3Vkt6UjlrQmlFRXNWdG9MTXhiZFBEZVVuNVpLdmJ6emtNSmZk?=
 =?utf-8?B?TFpIY2RMNGtkVW5XRG90Qi9xdUJ6R1R6a2EydFk2OThZT1FIdUJhK3V1ckUv?=
 =?utf-8?B?MDFlUjNUTldZVldYY0g3U21LbXV2YXZMR3VlTEpCdldiYTJCVlM5SUw5TCtn?=
 =?utf-8?B?ZUlOTUtMNmhIS2VkWDJZdnFtZUFaalBlMnhMM1NZM3plTWdvbmNCODBva0Nt?=
 =?utf-8?B?NytselRRSTJBZVU3QmxIc0pMajI4K3BZOU14czZDdXZjMXhnL3B0OWp4UWFC?=
 =?utf-8?B?OUpMdW1IenU2UTRoL1MyY09xS01wRWNhaC9oaWI2cG5taFN2b3VtK1RFZ1Jx?=
 =?utf-8?B?VFlic1JzZk5XV0tlMXNDd3V3NElMU1FjY2FJcllKT25FSlZlSHpGNDMvby9J?=
 =?utf-8?B?OTN2Nk9ZYXJNdWt5MzJFRklGK2IzYzd1cjlERWZlRm1XU0toUjFOemxvZTNq?=
 =?utf-8?B?YmVkeTRncHprREs3MTZlUTRvTXIyVE9TdDQwWFJaeEtvbm9OakcvNElFaFJB?=
 =?utf-8?B?Tnp0WFhjV3E1TTBJWklhT2RXN1c2SUduVXlRZ2p6UldhcStsakFtWU5qclkz?=
 =?utf-8?B?ZjNMRUVtZEU5YlZYWUxVSy9pUWFXREUybjZGQmhlczh4bTBzTzZ6a0tzTkhk?=
 =?utf-8?B?bnR2SHNuUUtLVyt3Y3g1aE54a2lWNCtzZHRYRmo1TGlLcjZVNlRVTTZGeVY1?=
 =?utf-8?B?Q2xTUEdVc3p2a3lYcjBnVkhVZG9JTkx4enBJODEzVHZZTW8wOGt4UjlXRmw1?=
 =?utf-8?B?VjR4TXJUdEdHRDR1dlNvckhwMTYzT2M3NktVRGZ3bjJ1Qy9PVXhwclRtZGFq?=
 =?utf-8?B?ZVk1MUlweVdrYkt6eDBrbktHV2Nyc1dZK2hUTFJzdFRwQ0FMc2t3WnN1Vk1X?=
 =?utf-8?B?c1NWT1RVcWE4amJSNm0ybCsvVS81M3FaOEQyRm9LcGlQaW5PWmZIZ2Y0dW9p?=
 =?utf-8?B?OFRhZ3ZhL0RPUXhvcWx1ZlpiaHlXQ21DTHNKb3J1akRiYW5xdEptbU5yTCsx?=
 =?utf-8?B?a1gvOE9ZaTY2QVpjNFFoZkxnZ3pNVTI2QXpGSERwM09zWXdKK2M3UkVQWnJH?=
 =?utf-8?B?QS96NjRFQkJybVBiN05uOFF4Qk9JOW0vOTVWZUdjNUZjVWFyMmtIZVFVYWdv?=
 =?utf-8?B?RlZUZG9hRVZjeVIvdHgwNWJjTk9IWWF4R1NrdmtObDdqM3Y2R3pHTitGRDZr?=
 =?utf-8?B?QlpTdkJoU2lFZkVsZGhYbVRrSmNHeUZZZ1g5VVBCdEJ0VlBzOHFGOWg0M1BM?=
 =?utf-8?B?RHZJOG9rYzFLVEYvUm5RamkvK2dPb0Z3c3crUEtyRGJUYjUyb1RsWUhMVTdX?=
 =?utf-8?B?Q2R3K2xWdzVGTUxDd0ZUdFpzMkZidGdqYXZQMnkzcmJ5RE9qbFhYOXhwdUtH?=
 =?utf-8?B?NkpFZkovSlRZU2d1YjVrK2pqTE95aFE1YzFlcnVINVdkaCtJS1VzSnlzL2Jv?=
 =?utf-8?B?V2tJT2owUGIrNHRZQStaMGhrY3Q2M0ZIbDdwT2xQeG9PZzUra1pMVFM1UlEx?=
 =?utf-8?B?K1BGQzJDR29CZFByMUNJc0ZzNkdZNVNwcG1QT2J3K20reHNLanlPR1lWbjFh?=
 =?utf-8?B?bzJUMGtlTURFUjltZzcwVytCM2Qwcis2YmpOSXJ2NElqRDBCYkt3RmNNd0wv?=
 =?utf-8?B?WXI0T09Xa2UrZmdOandNamRCTkllNGgyVUJ2UFlRYy9LcDZhMEJlYzljcjNi?=
 =?utf-8?B?THRuQSthMHdJMlBFK2xDSkJ1UERrR0NHWDFoV0RJS1JPUjQ2Q21JMUl4QjNy?=
 =?utf-8?B?UjdqbXpKZys4SXJta0pIU2Y3U1YyY3hZd1NZbmRmbFBGaXNUVXRhRGJHNng2?=
 =?utf-8?B?amZobkI1cWRNTVJXZWxxa0NDWW03bVJBOUIxdzhSSW5jL2Y4ZFBMcXZGMCtQ?=
 =?utf-8?B?ODF5YzcrTVJBYXk4VjhaSlQ1UE1tMkw4SHorZjM3YWpJUkNCdjBPa2c0NDR3?=
 =?utf-8?B?cmxaaWxZK2tLb2NvcHhtRHAxZ0JxaVpMam5pL0pKbWNRTklFTDdXTUtmUmV2?=
 =?utf-8?B?aVlPdll5dUIxeXRaQndySCsza3VscFNnVG9wR0p5K0VTdjVvYU9DUnJuSWU5?=
 =?utf-8?B?bTNIdExobE1vaEZIcWI1a2FxdDBTSE5vNmU3NDNiK0NuVHoxdVZoWlFuTUlH?=
 =?utf-8?B?enh3cGtvNUlCSzhiUmtBUkp4T2lLYUZVdEdLU21keDRUSFBwbURSUm1pUjlP?=
 =?utf-8?B?anZMVHhqQ3NlYjFQUG81K0hKd0ZPOGU2U1E0dVloRmp1UUZjWHBwcjF2UjY3?=
 =?utf-8?B?MU4xWStnVnZtUGQrbTc0dkwzb3BiMnREQUFZcVZrVFVwUzhRS3Vqak9YVlhR?=
 =?utf-8?B?aHdlR0k4Z1psSndNTXZpbU9JQmhMc0pBemUxZlpFUkhucG93M2E1MWgrM1pM?=
 =?utf-8?Q?F0cpVI/tv0bKPCpw=3D?=
X-Exchange-RoutingPolicyChecked: f2I1prPMmstQ9kpI89FV+VllxsBBlBgrWdvonS2X4Nspx9jI5MZs/rf2pxw/8bdFmiLovYNsJYf3ztPVBdhHIp80cVTXYui+1AoZQGUDsrkm0gNyiZ9GP6eHVLKCPuORW4jbnji6mC+H9uIrnXazGJXXcmDmz6pOBfM2BsHmwIWY2CjFyjoBa6ZijhkqyVmeZ9rD56fqhBJO6h+i9s43IcrbvXc+AIvGq3tIHkFK4GISbzQAgt7yDkmZeoe7ZxUnfGrH3MPjegWb3djSJ+lB/oLx6BTzhTaKxeA9lsLmaufOopt12pBfYqrGNBU23scV6j3JmydhNaSvqBgKqXeV2A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e372e78-a432-41d7-cc1e-08de84da7b0a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 10:38:23.8892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucf4/mso0pQn2V+9xLQzu3v6anYfHhlHV7i5rc0P1V0AN9nWZPoRl5L+5GHRO3uvrHslPjT/r43slPzWXc2qocQuPU4daz8juU5ugkEe2UE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7627
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


On 3/18/2026 2:58 PM, Hogander, Jouni wrote:
> On Wed, 2026-03-18 at 14:24 +0530, Naladala, Ramanaidu wrote:
>> On 3/18/2026 1:48 PM, Hogander, Jouni wrote:
>>> On Wed, 2026-03-18 at 01:00 +0530, Naladala Ramanaidu wrote:
>>>> Switch PSR status reads to the connector‑specific debugfs path
>>>> to avoid ambiguity on dual eDP or multi‑output systems. This
>>>> ensures the Early Transport state is checked for the correct
>>>> connector.
>>>>
>>>> Update the Early Transport debugfs handling in line with changes
>>>> introduced in KMD (commit c390bf07961b, "drm/i915/dp: Fix panel
>>>> replay when DSC is enabled").
>>>>
>>>> v2: Addressed review comments. (jeevan)
>>>>
>>>> Link:
>>>> https://lore.kernel.org/all/20251015161934.262108-8-imre.deak@intel.com/
>>>>
>>>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>>>> ---
>>>>    lib/igt_psr.c             | 8 +++++---
>>>>    lib/igt_psr.h             | 2 +-
>>>>    tests/intel/kms_psr2_sf.c | 2 +-
>>>>    3 files changed, 7 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
>>>> index 7e50c3dc6..09c34c97d 100644
>>>> --- a/lib/igt_psr.c
>>>> +++ b/lib/igt_psr.c
>>>> @@ -69,14 +69,16 @@ static bool psr_active_sink_check(int
>>>> debugfs_fd,
>>>> igt_output_t *output)
>>>>    /*
>>>>     * Checks if Early Transport is enabled in PSR status by
>>>> reading the
>>>> debugfs.
>>>>     */
>>>> -bool early_transport_check(int debugfs_fd)
>>>> +bool early_transport_check(int debugfs_fd, igt_output_t *output)
>>>>    {
>>>>    	char buf[PSR_STATUS_MAX_LEN];
>>>> +	char debugfs_file[128] = {0};
>>>>    
>>>> -	igt_debugfs_simple_read(debugfs_fd,
>>>> "i915_edp_psr_status",
>>>> buf,
>>>> +	SET_DEBUGFS_PATH(output, debugfs_file);
>>>> +	igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
>>>>    		 		sizeof(buf));
>>>>    
>>>> -	return strstr(buf, "enabled (Early Transport)");
>>>> +	return strstr(buf, "Early Transport");
>>> Checked this and to me it looks like it may indicate improperly ET
>>> being enabled. This is what I'm seeing in debugfs entry:
>>>
>>> Sink support: PSR = yes [0x04] (Early Transport), Panel Replay =
>>> yes,
>>> Panel Replay Selective Update = yes (Early Transport)
>>> PSR mode: Panel Replay Selective Update enabled (Early Transport)
>>> Source PSR/PanelReplay ctl: enabled [0x40000000]
>>> PSR2_CTL: 0x08000000
>>> Source PSR/PanelReplay status: SLEEP [0x30200011]
>>> Busy frontbuffer bits: 0x00000000
>>> Performance counter: 0
>>> Frame:	PSR2 SU blocks:
>>> 0	33
>>> 1	256
>>> 2	512
>>> 3	0
>>> 4	0
>>> 5	0
>>> 6	0
>>> 7	0
>>> PSR2 selective fetch: enabled
>>>
>>> So I think panel stating ET support already returns true if using
>>> this
>>> check?
>>>
>>> BR,
>>> Jouni Högander
>> Hi Jouni,
>>
>> In my system i have not seen Early Transport sting printed that many
>> times. On What config you this debugfs.  As per the Link patch if
>> Early
>> transport is supported it will print (Early Transport) and if not
>> supported it will not print the string.
>> # cat /sys/kernel/debug/dri/0/DP-1/i915_psr_status
>> Sink support: PSR = no, Panel Replay = yes, Panel Replay Selective
>> Update = yes, Panel Replay DSC support = selective update (Early
>> Transport)
>> PSR mode: Panel Replay Selective Update enabled
>> Source PSR/PanelReplay ctl: enabled [0x40000000]
>> Source PSR/PanelReplay status: SU_STANDBY [0x64200010]
>> Busy frontbuffer bits: 0x00000000
>> Performance counter: 0
>> PSR2 selective fetch: enabled
> This one is exactly the scenario I pointed out above. Your monitor is
> supporting Early Transport but it is not enabled. This is a normal
> Panel Replay Link on case where Early Transport is not enabled.
>
> My i915_psr_status was dumped on eDP panel.
>
> BR,
> Jouni Högander
Thanks Jouni for the review.
So i can skip the ET check for external displays till DP Panel Replay 
with ALPM is working. I will float the new change in next version with 
FIXME comment.
>> Regards,
>> Ramanaidu N.
>>>>    }
>>>>    
>>>>    static bool sink_status_checks(void)
>>>> diff --git a/lib/igt_psr.h b/lib/igt_psr.h
>>>> index 7639f8d46..53ab04483 100644
>>>> --- a/lib/igt_psr.h
>>>> +++ b/lib/igt_psr.h
>>>> @@ -49,7 +49,7 @@ enum fbc_mode {
>>>>    
>>>>    bool psr_disabled_check(int debugfs_fd);
>>>>    bool selective_fetch_check(int debugfs_fd, igt_output_t
>>>> *output);
>>>> -bool early_transport_check(int debugfs_fd);
>>>> +bool early_transport_check(int debugfs_fd, igt_output_t
>>>> *output);
>>>>    bool psr_wait_entry(int debugfs_fd, enum psr_mode mode,
>>>> igt_output_t
>>>> *output);
>>>>    bool psr_wait_update(int debugfs_fd, enum psr_mode mode,
>>>> igt_output_t *output);
>>>>    bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode,
>>>> igt_output_t *output);
>>>> diff --git a/tests/intel/kms_psr2_sf.c
>>>> b/tests/intel/kms_psr2_sf.c
>>>> index 1cc57ad35..7503c7682 100644
>>>> --- a/tests/intel/kms_psr2_sf.c
>>>> +++ b/tests/intel/kms_psr2_sf.c
>>>> @@ -961,7 +961,7 @@ static void run(data_t *data)
>>>>    			     "FBC still disabled\n");
>>>>    
>>>>    	if (is_et_check_needed(data))
>>>> -		igt_assert_f(early_transport_check(data-
>>>>> debugfs_fd),
>>>> +		igt_assert_f(early_transport_check(data-
>>>>> debugfs_fd,
>>>> data->output),
>>>>    			     "Early Transport Disabled\n");
>>>>    
>>>>    	data->screen_changes = 0;
