Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD67C109E558
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 06:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC9E10E9D5;
	Thu, 26 Mar 2026 06:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkabpcJh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191EC10E9D5
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 06:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774507600; x=1806043600;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dLUnlwjhhHfeWBjjSrC3Dhr0Spo5PXXsHZOmRea27Js=;
 b=EkabpcJhIf/kNnLgbGZTTDiF0KGMG/OLCSwQSDmN38PEsA5C+2hNQ3hf
 thTkmCecobMVQYENZfTWfLe2/rqJyn5WY9znniEUyL1/JWZyJnquVC4CE
 iUT4BpJvOWZrTeHOF+hH9jRUNElmexVwr+0HD0SOBrvseGAx7ulii7GVQ
 VemQ0fS6m6DjklKf3LH/A0oYo7O9sQlutjft1IRWwgkYywtXihH2Ej3km
 mJbjmqZBBRm9YiOkvlF97lljs/ukOkjBVa86WarBsHXMy6FWpXBo9SFZ1
 k2TKCjfNavZ5vF7erH21JaQb1DDA0DjZ2saWBTkVXT7CGl5hR8XMj5tDO g==;
X-CSE-ConnectionGUID: cszJlOCHSIOmKeTUEhGhLQ==
X-CSE-MsgGUID: Irv/QO4cS3m8ma+U3PBfpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75441557"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75441557"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:46:39 -0700
X-CSE-ConnectionGUID: FjukZJzuR7K4ssMiisiQ/w==
X-CSE-MsgGUID: +O/f8jj6QOeGy4XOVqoZzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="224942762"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:46:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 23:46:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 23:46:38 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 23:46:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MsqWdXK2fRVVxZjoCatXB6QPAE3WlvOisI7POy9jCgKLdMfkRzxBkIBybryuuhMNV6KYzZurN84N52nJQahxy4Q/AlQP5Wmntvmj1ynIZjCwvWbOacTopdh+fCtcMZDgKv9Sbc3J2nurohSHexSRcT/a0SPU/NyhWnANYUhO0SuUElLq3C896ZMbmqiJGwwyaV7oeb2KBxIdbVA5ikn1ihjwSH1OjSI25qem0uCbFcbF0Dol6THK3lGRCOfzKMa4VOU9ngqXt6Mh40u8KNLfSefmyLsgIOqvUWMjsSUtxGSPP6cXjF+dxJeXhKltLXEdeVI7dLg5EEn0WeRJPVUPNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMpbvgEH4glI9wVZVkXOXd/2pwLv18kxUuqi2NTZFU8=;
 b=TO852k92+WqHzN0KdczaxeTPcW6tKAKLaRsc/LNN6Uk1imCj99KnGQPUnU19A6SaOxQ78IxcbPc/i5Ord3sQw1Xev5sDBGrbVlJ5gEyrzllbUS86dTnv2w0FDkFNpDOQpvYBMeW5VhqjpwnlJQx0qX1P+ZqzSZ45CDRCP0eAt8FZPgr39QyiwFNS1MVDhFEZv5ww6ujoI7ZvqhUiuKYMG9hG/UriQ76eCmxmfehVZyZNkHVm+L57lR5GhWIoZZBmX0+lP8cRQ+DmGoak5UOPDNgn8lvq3G8P1rgh8lbs0yeztACDLv0KJumkbVFn3VFCypPFw2Sg1X+mqDJicRCCKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DM3PPF818092190.namprd11.prod.outlook.com (2603:10b6:f:fc00::f34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.12; Thu, 26 Mar
 2026 06:46:33 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9769.006; Thu, 26 Mar 2026
 06:46:33 +0000
Message-ID: <bd01312c-1276-4672-9a7f-b3ad1c32cf80@intel.com>
Date: Thu, 26 Mar 2026 12:16:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 0/4] intel-ci: Add Xe FULL chamelium run type and
 testlist improvements
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260326064201.783311-1-sowmiya.s@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260326064201.783311-1-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0251.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::12) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DM3PPF818092190:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3cb2f1-14eb-4863-d78f-08de8b036aaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: qRAr5YGAQmMjdVr1OlWi3oaeqWz4E7zYxLd6Gx0MZ+pjcebxj2uJiPeMQ3REPtgXqDoyjbETnbz9DSn+0avmK2zjuHHXOercw9XahRxltayPfJrx7cBKPsLZ7mD7LGaiPJHsmzoPgPBFc2UVH9ncCtbpN9+FOz5FyDqHPsAUF8UjkuQXJ3xuV0HIcA6ahrgbrdDAy6+5DOaA/gRK0BAVlJLnPOPJtEB1OBO+S8alXPJz7cLKiDMZS+9Gw+5dREWwASMm/y+0M8N4H7bZpqEtjtovXcPBD8aNQDRubW8JxkDP1rPzKRWlea6LI7Ht6QRQcUuq+SH/D54CVBm8m8E+Ejqn40s7uSDk0U4jp5rtGdKW3SDdctTRysyh1Yf2IsF1wzB90hIyjv+YMQR4InY/3v2a4d0qEJaXk6NO0dDVclN7qE4JI2BAdqLLW7lFInSS+gm244bR9U3HmsyMPUMKzzJFLR+v9si9OkCU4HDKy5uLQANnViVdDi0/rDOyWQdt8Y/At+SUJ1IMXUzJsWmuGy/AAfmVM03ON6XKE2KImbB+ZGv1/dAG1PvxZ4rwzhYU4zKWQxKB18cdQt+2ddRHL+slTpGgQ/HbuaGnjTjdUywe8pK0HuMFkJaadYMLf4R7Oxcr+N36X6IF2BESme9k79gS9SXCSWt864zQYwE6qyDz7WuzbuIUOfAn48O0qp4A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3k1S1RXcnlpMHlNR2JLR1lVRU9NUmNJL1BCdjhJYzREbnlFMW1aaURwbVpL?=
 =?utf-8?B?NTFHTXdLNWg3ZDl2K0FSUklJQnZRcXBPR05JeGxpZEpQNmJFTDRQWnRmS3I2?=
 =?utf-8?B?eDA4Uk5SVGN4bnlOQ2lzQXdjSXhLZU16ditNU2x2QXdoYVg3c3haKzV3MmpT?=
 =?utf-8?B?VEFsdUN1ODZUK2lxVkZ3OWhwQ21BOTlYUU1rMTFNZ2hDMWk1Wmh5RTJwODYy?=
 =?utf-8?B?UnQ4L3R6b1RIa2V6VitEVDFRV0ZqVnNEa25leFUwcm1TTThqMmxtK2VyK2RU?=
 =?utf-8?B?RWFmSnRoRmduQTF0Qi9kcVBxZlg5anpGcHZlcGtzS0o3dGt4cTQzVVpuTFZs?=
 =?utf-8?B?OEZ3TElTem9WZk5WYTdZdXU2L3hReEJESnE1eFR2RUg3V01aSWZTOWNzckM1?=
 =?utf-8?B?ZzdQL0g2ZXIyZmVNaFRtQ3BrZHNhb0dOY3J4aVdtbW5od0ZEeFRIVkljaDNI?=
 =?utf-8?B?SHNMRS9RZTJPbS9sTTBOaGtQckl5V3RjZFh6ZkZxVUhodERLS00vS3lGWjJj?=
 =?utf-8?B?WkcvZFBFbzg3bXVVSjQ2a204SzJQc1JpSkNwZlNGMEVPczd4M01KQ2hEeVpM?=
 =?utf-8?B?TlNWQ0ZxaUprenpTUjJVdEJhaFJkanRKaVcrVm5KTGFjYXhJa2FRbCtoSE5u?=
 =?utf-8?B?cjdSVTlnVTNhMmJ4aWNmclNRRnZNeEpKb0UzUnZRZE0zVlFEdFN2OFVxVlc3?=
 =?utf-8?B?SVgwWGxCVTBMNjBpdjlGNHpwcjFFdHBtR3B5WWxvc1RQem9YYmszS0VBYWFY?=
 =?utf-8?B?dmFaVUwzcDY0SFd4NlZKSlpqVkZ1cGFMYzAyam0zSzZYdG8vS0liSWFjY3l4?=
 =?utf-8?B?QzBEaXdtUCtTTVJ1MmJGaGhFM3hiMUhiUjMxeFYzREY4eTFML2Urbk9HMFIx?=
 =?utf-8?B?Vk00UkoydXlMRzliLy8rdEQvTG91ZzNDcFpiaFp0bW90MlNmUVRBZEl1WXlI?=
 =?utf-8?B?amdJbUs0MzVzdk1JYVNoSy9QeFB5SjNaeGtZak1zV1BndG5pKzhQSUhxZUVy?=
 =?utf-8?B?WlN5N0owWXpMeTN1ZmlJbUl4Vkk3T2dkMUliSzlLanlwUmdGMWZPU1dNckNH?=
 =?utf-8?B?Y2hNZWpBWGIyUWFrNmdyTUhJc2ZtNGxZMzJWUjd0L3ZNTkQraEtqOW9OTHJt?=
 =?utf-8?B?K2FoOTNaZmhkV1o0WVgwZ0JNeWdhVlRBZ2hvaElJd0ZwemVuUnZONzVhaDZR?=
 =?utf-8?B?eXhuK2Q0ajFyR2ZuN2NxZVd2eHZOZkRmMVRPVjZoTkpucURseUIzU205RTd5?=
 =?utf-8?B?WnBRQ1VtdkV3V1o3NXVMVG9CMjZYQ0Q2cVJ0aWM5dE9wRXk2MWlKWmpqSjBR?=
 =?utf-8?B?TFF2VldCbHhiSzVPdm9saTFmOC8xcnBOeWVmMUdiKy9VbnVLK0tSc0NuSzNN?=
 =?utf-8?B?TEJCVERNRkFLNkVud2c0YS9GeFJPbnNwM3dFSG92bE5UZVJqdkM2NlplUmZD?=
 =?utf-8?B?Y2dxeHpadnhjbytqaVl2WXpMU3ArNzlML01TK09CQzByNTBUYkV2bDRhR3d3?=
 =?utf-8?B?N3FHbXUxOE5EQ2dWY3VncHF0eUw3cWdvcW41djFCcDlVcXFnU2VBUnlvb2lE?=
 =?utf-8?B?U2tQY2duN3JxRjhvZGwyWU9wVlZyalNKdk8yb3BHa1FTQW1qcHQrMUJpeEtl?=
 =?utf-8?B?VGhNYndkdUIwcW5YNTdIaWZkb2ZKaVF4UG9CYW9zQUdXOTQxQk0zalJpTEl5?=
 =?utf-8?B?aEZoc3BIK3FpUHlBNTBvdDdYQkFQRjg4a3U0b3ZqTHlkR09RZXBDbmxTTlNF?=
 =?utf-8?B?anNIUEpKdmVaRUZuUXlsRU1UU3p0dDgxTzQwc3k2U0RQZzR0SVRZMXRGZHpk?=
 =?utf-8?B?TEZMYnJBSmtUclpLUFlSaWVhaFZ3b1J4WTFLdmZrd2UyODEzdHcyTVVVYWZl?=
 =?utf-8?B?YTFVU2RjL3BnNTFxN1ljRjRkZGViT2dmeU9LWkdCazhzV0d3Um1vRHhQZHJh?=
 =?utf-8?B?WVQwRmpSUjIwNmtvSG1YK0R0WDlMUTJDcFROS1NyK09ycHJya2xINXl5ME1y?=
 =?utf-8?B?Kzg5N2ppdE96ck9RdWJVb2d4M0p1Ry94Vk0xVkdLMGNWemF2YjRuelB3OHNS?=
 =?utf-8?B?Y09HcXFGMmtDMXNjVmo3ZEkwQ1hhU1FpeFdTSDE0b01vaWdEbEZZZzFFN3lC?=
 =?utf-8?B?aWZIWXBwRzVFS0o3bnlza1F1UU5CNWRZY3h1bk0wS2FzS2RhcmxXTi82RzRn?=
 =?utf-8?B?ZHYwNmRHc3BMTmw1bGdMV2lYT0QxS1BseUNCbVhSQWRkUlN3bHJtOTBmZytH?=
 =?utf-8?B?R0tqVUxsaFcvSXVNc0pZYUt5NmNReW83NGNKMjE0TGY2MWZ2bXhCaXFCMnAr?=
 =?utf-8?B?cWh3VWxFUGV3bXdROEJpc0FMUG41L1NwUDJPenY1dE5pbXdFNDZwZz09?=
X-Exchange-RoutingPolicyChecked: oECrlzPOkd/ljw02ACIZZ7HU6O2hM/ZJ1B6+bm7xLTt6xSJrOkIGTxKHeHgYsLtuabBwcWsxvrkOCslHrXpiYsRN/Okzy/0pLwY7VXUdk/QMQdRTb+zVBKYQyCObRjr9vOJGl5jPisSf0++USUtslGZSoTaGi92ChTnzJPOLv1TDTwfInsJRnjcLyEWC+GPErU5HC7+TJNMrMqLJe5kf8iJecjxRYup01mLXrQlCaad8YFtoS90gf/Py/4JEdaqR8zs2ZQmTI+FIH48DVA5es0UU/IlkQJ6h6iHT01bIW6qcUozuP5GuAY1huF14da8mI+R2uJxUECkh4LvAbzs4Fw==
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3cb2f1-14eb-4863-d78f-08de8b036aaf
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 06:46:32.9089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FP/+nYdbV7ykZzQcI+lwP7Au5BznFwdt9FavUO30JMzNBMS/7dG3qW8iW1BNS2/CtlzMsXqR3K+HawYgQhwPeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF818092190
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

Hi Sowmiya,

Overall series look good. Since we have fix for planes-random

https://patchwork.freedesktop.org/patch/712144/?series=163296&rev=1

Lets drop this test from i915.blocklist too.

On 26-03-2026 12:11 pm, Sowmiya S wrote:
> This series adds Xe driver support for FULL chamelium CI runs by
> introducing the Xe FULL chamelium run type in kms_test_config.json,
> sharing the existing chamelium-only.testlist between i915 and Xe,
> and using driver-specific blocklists to handle platform differences.
>
> Additionally, it improves testlist reliability by moving suspend/resume
> tests to the end to avoid system hangs affecting main test execution,
> migrating inline test exclusions to blocklists for consistent filtering,
> and adding non-deterministic random-plane tests to xe blocklist.
>
> v2:
> -Update commit message
>
> v3:
> -Sort tests alphabetically (Kamil)
>
> v4:
> -Add detailed comment (Swati)
>
> Mohammed Bilal (4):
>    intel-ci: Move suspend/resume chamelium tests to end
>    intel: Add Xe FULL chamelium run type to kms_test_config
>    intel-ci: Add VGA chamelium exclusion to Xe blocklist
>    intel-ci: Enable hdmi 4k resolution test in chamelium testlist
>
>   tests/intel-ci/chamelium-only.testlist | 22 ++++++++++++----------
>   tests/intel-ci/xe.blocklist.txt        |  4 ++++
>   tests/intel/kms_test_config.json       |  9 +++++----
>   3 files changed, 21 insertions(+), 14 deletions(-)
>
