Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41314CD6E5D
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 19:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA6410F56D;
	Tue,  2 Jun 2026 19:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tj1NKo7r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72AA10F56B
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 19:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780429966; x=1811965966;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=d3VOWuuWi8V8PWrAAtIU1zxf1Bg64D9AUa2NTf8u9CY=;
 b=Tj1NKo7rfzwbo/Mm526NZ62JcEjimXw6nSXqvE9ANpvm6Oo6sPPjKKay
 Y5SOuEkoFEt+/8KOrgcXP3WKSVg377qm9Qyvk0lyAFZivLnZZi5m2oXAZ
 XnuKLWSNt5kcaxykrqaJH56xL8sb4YMHcIsdEHIuD+sl2uz6hTnOOhl1O
 Kc1chus8FjPr7d5Cyb6BhyTSJ07u9ZszKslLzA1g5TOR7DboVT8+MT86Q
 WRB+SZj3W54CjeYF7F7iIEppXlDZrVqMcLwFn/elUEsMkAyeyiPd/n3hL
 VZSP+u+I3XFl+n2/oUNKIbTlnGxWH3TkaDOfRSGBNo9l+w6Fqwcv/bAiB Q==;
X-CSE-ConnectionGUID: pey/ivTpTx2LspQvyqdEIg==
X-CSE-MsgGUID: sBXT2ctQRhWmG+pNAOWZyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="106675521"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
 d="scan'208,217";a="106675521"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 12:52:45 -0700
X-CSE-ConnectionGUID: 4Mwk+hSqQDeDEHhelkT2tA==
X-CSE-MsgGUID: FRabVvWITxiUL90hbgP6tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
 d="scan'208,217";a="245816981"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 12:52:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 12:52:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 12:52:44 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 12:52:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHJu6dZyM7qdU/q8N5S6Y/aWekR6mSvd/is37SBHmHfMt+MJNj4uRFaG/IOKamdTiavlwyCZ9nqhXcdTwzTBaDm9znl4nOwtAMU+7Ri6W75CRNstIKaX2gO+iPha74epoOMpkTqhuvbA7ef4cZablB4f3sWH+nsa5Oh1l25wO0q0DfNkN5cHPG7tyHfGhBpYD2hGrA9N01ik7/vNMnJV1OpFrig42d5dNvO/H9sZsCd0YqMgRsl93JaEhpGkTgAiH3NMfFDOsjoIWO4ODV3tdhPFdqUWCab/Hk1Tumodql+8ItnI4iEorFLVKg3FUYilkUrB5XcORdGmkWseswUVAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58JBrgCwH53ey6tOnyoumIWGO7RnEM9R2QQuaNppkq4=;
 b=fpdR8Vh/p+/5z+Bvy0wuPumSr74y5xeaH7f0TeXQUcpxiPOijMC/d+c2hpU3ij0/vWlKA21LucLRWCz1ndEFWnz+pDK09DxeBKjrbMrjcAmdSesmBzSspJRGmScFs3cGj/YAfZxkGP0MeGpb3TaWd0ExUxFEkF2Jwwh6Kokzbb0SG0Uiw0NDJkoEIZRZjrgt59OSszKDmF8MOHIanPb4U8ygkCdaVDwyYKm9Zz9ZnZApeOmw8JITphgCLo/UEI9mOzjPFgde+wF6cCrXtSel+JCK384UtqDxIrDdheTDVsE1yLJNb7vBHlbJpAFlIQVqVCrY5g1Som6P5+trr3Tn4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by IA4PR11MB9418.namprd11.prod.outlook.com (2603:10b6:208:56f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Tue, 2 Jun 2026
 19:52:38 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0071.011; Tue, 2 Jun 2026
 19:52:38 +0000
Content-Type: multipart/alternative;
 boundary="------------g8n94wfoYJ00AcxE6RG0hlmi"
Message-ID: <02fe5936-4000-4e1d-a962-23723d774f24@intel.com>
Date: Wed, 3 Jun 2026 01:22:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] tests/kms_color: Add 10-bit color depth support to
 gamma test for MediaTek
To: Jay Liu <jay.liu@mediatek.com>, <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Paul-PL Chen
 <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>
References: <20260531031732.16600-1-jay.liu@mediatek.com>
 <20260531031732.16600-2-jay.liu@mediatek.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260531031732.16600-2-jay.liu@mediatek.com>
X-ClientProxiedBy: MA0PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::19) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|IA4PR11MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e69ae1-fb18-4419-1461-08dec0e07f9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|8096899003|3023799007|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: Ob/kYIB4Wxfbdk6iM2lNnQYh5qLDbWdf6JpcY2ZBaLyAWyxZ2p4pWPszI0RhHKFhqfnNTUPA+tb3OHVQt71V3qCdaPO+toXqk0FjfuR8wGD1r2R1OVugNFpX2k2dAmYXzmuiOyHsQ8PLHUYYy3uFqcpz+Os3qHT9bzjixyB54auHAAB8rJyhU8q4MMruSt03ZSjHgVVVvYQTMLHS3YhvoiLnDh/uDIqEzLI9y4/S/BX91zJ4wGfwBznyh6mcGmzwXaqJoemrfnQCLgDsEoDL/XL4dSnBsV2flWgRB5KLFOAFz5P+bme6YzdZn3Zm+lnt0owk/fMUWLHQQPhkqb1gNdGQ9cO/pkmSquywCyDdDFEDOxnxvz93YqIjKttqWAfV5/WygQomYlFUogZDAlwoTLtHjXU+VcPmt1pTnnJ7+TufwvAD3p8Vnh5S2ZXTyTthMOF7cD0xIbcCAWCBHvjImVcn+2MZYgslMZclUWTXuMgEDwSOX0olldIwYTHn4Ztz+0e5U/a87xHk27G7hTPcWBQzk2MrkuZUVWr5GU/BJpv7Y451S/f1Pa1te6PPWgg4iBL4ER1cC0Yw9FomxtyZE7O9AenXhgltcotxmvVDF9VbOrKHgsLhIeqVIg7xq8NkKVegf4OY1Dw1F1emsyoXLuykMvvBQDg9Ve77G8HvItDVZkmiMKDvXPG1twDUSj3i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(8096899003)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ulg0N2J3Qk1MY0QvbzFQWThhTUcwcnoxVlhxRGE3b2ttdXZlQUZpNXlQTGFO?=
 =?utf-8?B?aVdKaFBUMFdVSUlGZGM3YXNaSzVYY0FoNGdWdTczSjRkK2tKNitQd0FxTlpk?=
 =?utf-8?B?OVRrbGxRcjNJZkNlV09UajU5QkUvYjVrR09FRzJGdDMrQjBJWXpPclNXdnQx?=
 =?utf-8?B?R0F2Q0MwKzJKWmgwd2pFajdWWTY0QnY1clhSUW4xa2ZWMExZVE9WUEZDa25p?=
 =?utf-8?B?VDRRY2wzRmJzZFZOUkI0a2JYWTVFTnljNEdCYVM5U1RtUjBFSm1EUmRmSlBk?=
 =?utf-8?B?U1A3TzRZSmdyZjZpNWdFbWJ3UElqWmM4am9YU2dWZExPTjZkZVF5MEVwY1hN?=
 =?utf-8?B?ckQvK2tZaG4xYjZJZHVpOWRVZHZ3cFh3OUU2Zk1ZTGl1YUhvZStSU3VJZjN1?=
 =?utf-8?B?NEpvYVJHUUVGczUyZW9jUFd0bDdpQmJDTkswN0ZrMm0xby9pbEZDZ1hPWGpC?=
 =?utf-8?B?eU1EbEljbEtsVWUzcmMrNWtSWjNJTklObjBqbUN5aHpMbDk5UzVGUUZzQi9Q?=
 =?utf-8?B?aTR1MUNmM0IrRUZ2Z3JoSFZwQ0w4cHI4VWNZZ01Ud3JNZXN5eVpNSnRseEMr?=
 =?utf-8?B?cGFjNXFwbXdaUDE2YXJ5RkNoQWRuK1ovWTkyS2VyaUkrelR0aFBqdDlMbHJS?=
 =?utf-8?B?ZUlDb05WempwY05rL0ZTVUNxZUhIOWt0ZzFJaytwNEFQT21ML0hwQzhxb2RP?=
 =?utf-8?B?ZkJjVWVHY2REaEJiZEJXM0xCaFFkS0JvMmtPSzdIblJ6cDBMQ082YVFpcHJ4?=
 =?utf-8?B?TmpYbWZKWXF2aXVwS0JBQXB0ZzF1anRYY0N1K1JTZ0hHQjR2SmU2R0xNc3No?=
 =?utf-8?B?NTBWU2llNGdEVmpLVFppRm5FdS95TkxUcDQyMXFSQXlRRUFIWUJZWkVFdVVw?=
 =?utf-8?B?Ymw1ZitXdWdUMnRic1Y4M0Q0WkZVcjUvYjBwNGU3ZExFVmpkd1FXY20rV1pa?=
 =?utf-8?B?RUk2T0srQmhzZmpXZ01ENDNGYjJHMnBibS9uMnpvRk44Y2xxM2wzSEcrVUJD?=
 =?utf-8?B?L2Q2Wm9tZUUwSjJSNENtSkNvcjF4ME0vNmlzMmJRbXMwSmJSeEhVOVUzajRh?=
 =?utf-8?B?N3JzMGMyZHVFdGE2eFdTNG15UHpkSTRkQmtJSGpzRHZJY3Q3SSthc2FxWXh5?=
 =?utf-8?B?dE9CTEh2YTFocE9ONzNGUFlSRXNaS2pMbmhZcVVZZTJPVndKR2s5UWdWRm9N?=
 =?utf-8?B?dWIxakpTWm42VTZIdEZPdjlzUzExTGxWZDg5Y3ZjQ2tLd2N1bktmUkNiNitW?=
 =?utf-8?B?cDhxdHpGNmpaSU9XbnBNa2J1d0wwUXdDUldHK0FLZTJrM2s4T2Q2N2pDM2NX?=
 =?utf-8?B?dzVhTGxZYWhLR2lZNzFwNVVwZjhEOUljWTBHTXArMFdPNy9BeGhwN215MERT?=
 =?utf-8?B?czZHcVc3ZGpoYzczS2Q1VExzWlZLNXpWbW8vU0VtbzBpQkJqeVRVSlNjTmIx?=
 =?utf-8?B?cVVvZ1M1T09FV1IvekpZVm94OXc4bkFDRERxTXR5OVpCbmRxcms0dTRVK2Ux?=
 =?utf-8?B?Z2RwRkUvRkpMdUpMN0xld3lRSFk2blNhTTZkUm0wNE5qc01qQ1B5Z1YrMnFq?=
 =?utf-8?B?OFRGa3RFK3Exa2t4d0dwb3ZFa1hTNk42RGJPSE5acU5mRlFydXFXV1NZa2F3?=
 =?utf-8?B?THFBZ3I0cXJYQTBERGMwVlg1MGpYdDBtb3J6MGtmRVpnR2U4M1BXWE15QmJX?=
 =?utf-8?B?SVA0dWZjYXdRVnNtSXhaRTlCVVRHZmp0N29pK1FnME9nMlBsS1RPd0ZkU0dJ?=
 =?utf-8?B?clp5TFJ1QkhHYjFsc09wckErREtIcDdtaSs4aXZqSEFSZXByU3NkVHI0dzh2?=
 =?utf-8?B?VVV1K3JtSkg5aHdncnpHd3Myb1pBWjd2d3pVdW9wUXVJbTZXbVVFblAxaDVR?=
 =?utf-8?B?L29wSkZyWWt5c0d5d1YyZjhHM2V3MWJQRHhvWjBnbXZQVXh4QTlTZlN0RmZM?=
 =?utf-8?B?SGRPTy9La0Vyd1dTK0ZadVEyVXU2Q21wWEoySTNBR1lDQk5MZzR1VnBnV01n?=
 =?utf-8?B?d25sSjNDU2hOMFQ4ajEzSGMyYmRTejVYdEZzMGFkeG1BQ0NNVzl2MGFSMkVH?=
 =?utf-8?B?OHBnSFo3Vit0TTNJWGREdnFEQzhnbDJ2WWFDUG1KZUtBU2FxVVhwZFJHT1ow?=
 =?utf-8?B?bnJEVmN0YmxvUzRTQVEzQ0dhRmRjNTRycENmSm1xVGM3ZlV6S2xld1JrUmQ0?=
 =?utf-8?B?VXFYbXlTSmxuQ1BCNDdYRFZ3dWQ0TUpaVURuR0MwVnJuMk55V3NVSG9UbnpO?=
 =?utf-8?B?NFhra21aYzJLWEpoTDRtRVdLYVdYQXEvL3grdW5oeEx4K2tXcndKUk10dW5Y?=
 =?utf-8?B?VzBia3BHR3FUdzA4ZHB1K2JYR2NnTFk1N05kY04zOGVLd05nTktwUT09?=
X-Exchange-RoutingPolicyChecked: NFs9HCHWbkFR3e/EdrMKSJdOlIAhCs01Z36xl8WZ8uSgDBcEitXFSw71zaFTfJQeYuuybFe4J/2my1wlFbFgHojWaVY1zpO6284iTGpVRYRDQN8k2ojKiV3wCsYBHLqYQ99IKK4fUnkoE+jrMxorqyLNS/4lOXwPwdaXwVuVqLTlDW3syF9NFEzt1tbcXVelOuVtt+LCzXLP+Q5+RWrQe3VkwHvICn3wMAhzkwH3GxOSpd7H9UU2HeBkB107TchFLJvYzacl0cAWKt7nFCHiwI0WgXOyKoteJtnEfczdxAmw+y0Y+NVK5USgaZGjL6zM8axw6fJdrMkiOy4X10Y4cg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e69ae1-fb18-4419-1461-08dec0e07f9d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 19:52:38.0590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThfDPxYCicjGQ71h4UpVoOFE5lqULDfWXPAwwcfr6xU4Tcx5zTtYuYHahxpFg8eqvuSxYq8Vjt7WoAOwRaCOxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9418
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

--------------g8n94wfoYJ00AcxE6RG0hlmi
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jay

++Ville

On 31-05-2026 08:47 am, Jay Liu wrote:
> 1. Add 10-bit color depth flow to gamma test for MediaTek devices, which only support bit-true results with 10-bit data. The test now selects 8-bit or 10-bit color depth and framebuffer format based on device type.
>
> 2. To satisfy the legacy gamma test requirements, the MTK Gamma LUT limit should be set to 4092, in the current 16-bit LUT design, setting the entry to 0xffd0 ensures the driver maps it correctly to 4092.
Please improve commit message. It is little bit vague. Explain "why".
>
> Signed-off-by: Jay Liu<jay.liu@mediatek.com>
> ---
>   tests/kms_color.c | 34 ++++++++++++++++++++++++++++------
>   1 file changed, 28 insertions(+), 6 deletions(-)
>
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 565edb2dc..4c32591aa 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -265,6 +265,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>   	drmModeCrtc *drm_crtc;
>   	uint32_t i, legacy_lut_size;
>   	uint16_t *red_lut, *green_lut, *blue_lut;
> +	uint16_t lut_value;
>   	drmModeModeInfo *mode = data->mode;
>   	struct igt_fb fb_modeset, fb;
>   	igt_crc_t crc_fullgamma, crc_fullcolors;
> @@ -288,7 +289,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>   	fb_id = igt_create_fb(data->drm_fd,
>   			      mode->hdisplay,
>   			      mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> +			      data->drm_format,
>   			      DRM_FORMAT_MOD_LINEAR,
>   			      &fb);
>   	igt_assert(fb_id);
> @@ -296,7 +297,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>   	fb_modeset_id = igt_create_fb(data->drm_fd,
>   				      mode->hdisplay,
>   				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> +				      data->drm_format,
>   				      DRM_FORMAT_MOD_LINEAR,
>   				      &fb_modeset);
>   	igt_assert(fb_modeset_id);
> @@ -321,9 +322,22 @@ static bool test_pipe_legacy_gamma(data_t *data,
>   	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
>   	igt_plane_set_fb(primary, &fb);
>   
> +	/*
> +	 * The Medaitek Gamma LUT maps 10bit input data to 12bit output.
> +	 * In this test case, the maximum input value is 1023.
> +	 * When the Gamma function is disabled, the data defaults to a 4092 output.
> +	 * To achieve bit true results, the Gamma LUT maximum must be set to 4092.
> +	 * Note that 0xFFFD0 represents 16-bit,which maps to 4092 in 12-bit depth.
> +	 */

Typo and incorrect comment.

s/Medaitek/MediaTek

Comment should refer to |0xffd0|

> +	if (is_mtk_device(data->drm_fd))
> +		lut_value = 0xffd0;
> +	else
> +		lut_value = 0xffff;
> +
>   	red_lut[0] = green_lut[0] = blue_lut[0] = 0;
>   	for (i = 1; i < legacy_lut_size; i++)
> -		red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
> +		red_lut[i] = green_lut[i] = blue_lut[i] = lut_value;
> +
>   	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->crtc->crtc_id,
>   					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
>   	igt_display_commit(&data->display);
> @@ -752,14 +766,22 @@ static void
>   run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
>   				 bool (*test_t)(data_t*, igt_plane_t*))
>   {
> +	bool depth_10bit = false;

This can be simplified.

bool depth_10bit=is_mtk_device(data->drm_fd);

> +
>   	test_setup(data, crtc);
>   
> +	/* MediaTek requires 10-bit pipeline for accurate (bit true) color processing */
> +	if (is_mtk_device(data->drm_fd))
> +		depth_10bit = true;
Not required.
> +
>   	/*
> -	 * We assume an 8bits depth per color for degamma/gamma LUTs
> +	 * We assume an 8bits or 10bits depth per color for degamma/gamma LUTs
>   	 * for CRC checks with framebuffer references.
>   	 */
> -	data->color_depth = 8;
> -	data->drm_format = DRM_FORMAT_XRGB8888;
> +
> +	/* MediaTek requires 10-bit pipeline for accurate (bit true) color processing */
> +	data->color_depth = depth_10bit ? 10 : 8;
> +	data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
>   	data->mode = igt_output_get_mode(data->output);
>   
>   	igt_require(crtc_output_combo_valid(data, crtc));
--------------g8n94wfoYJ00AcxE6RG0hlmi
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jay</p>
    <p>++Ville</p>
    <div class="moz-cite-prefix">On 31-05-2026 08:47 am, Jay Liu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260531031732.16600-2-jay.liu@mediatek.com">
      <pre wrap="" class="moz-quote-pre">1. Add 10-bit color depth flow to gamma test for MediaTek devices, which only support bit-true results with 10-bit data. The test now selects 8-bit or 10-bit color depth and framebuffer format based on device type.

2. To satisfy the legacy gamma test requirements, the MTK Gamma LUT limit should be set to 4092, in the current 16-bit LUT design, setting the entry to 0xffd0 ensures the driver maps it correctly to 4092.</pre>
    </blockquote>
    Please improve commit message. It is little bit vague. Explain
    &quot;why&quot;.
    <blockquote type="cite" cite="mid:20260531031732.16600-2-jay.liu@mediatek.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Jay Liu <a class="moz-txt-link-rfc2396E" href="mailto:jay.liu@mediatek.com">&lt;jay.liu@mediatek.com&gt;</a>
---
 tests/kms_color.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 565edb2dc..4c32591aa 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -265,6 +265,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	drmModeCrtc *drm_crtc;
 	uint32_t i, legacy_lut_size;
 	uint16_t *red_lut, *green_lut, *blue_lut;
+	uint16_t lut_value;
 	drmModeModeInfo *mode = data-&gt;mode;
 	struct igt_fb fb_modeset, fb;
 	igt_crc_t crc_fullgamma, crc_fullcolors;
@@ -288,7 +289,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	fb_id = igt_create_fb(data-&gt;drm_fd,
 			      mode-&gt;hdisplay,
 			      mode-&gt;vdisplay,
-			      DRM_FORMAT_XRGB8888,
+			      data-&gt;drm_format,
 			      DRM_FORMAT_MOD_LINEAR,
 			      &amp;fb);
 	igt_assert(fb_id);
@@ -296,7 +297,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	fb_modeset_id = igt_create_fb(data-&gt;drm_fd,
 				      mode-&gt;hdisplay,
 				      mode-&gt;vdisplay,
-				      DRM_FORMAT_XRGB8888,
+				      data-&gt;drm_format,
 				      DRM_FORMAT_MOD_LINEAR,
 				      &amp;fb_modeset);
 	igt_assert(fb_modeset_id);
@@ -321,9 +322,22 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	paint_gradient_rectangles(data, mode, red_green_blue, &amp;fb);
 	igt_plane_set_fb(primary, &amp;fb);
 
+	/*
+	 * The Medaitek Gamma LUT maps 10bit input data to 12bit output.
+	 * In this test case, the maximum input value is 1023.
+	 * When the Gamma function is disabled, the data defaults to a 4092 output.
+	 * To achieve bit true results, the Gamma LUT maximum must be set to 4092.
+	 * Note that 0xFFFD0 represents 16-bit,which maps to 4092 in 12-bit depth.
+	 */</pre>
    </blockquote>
    <p>Typo and incorrect comment.</p>
    <p>s/<span style="white-space: pre-wrap">Medaitek/MediaTek</span></p>
    <p>Comment should refer to <code data-start="660" data-end="668">0xffd0</code></p>
    <blockquote type="cite" cite="mid:20260531031732.16600-2-jay.liu@mediatek.com">
      <pre wrap="" class="moz-quote-pre">
+	if (is_mtk_device(data-&gt;drm_fd))
+		lut_value = 0xffd0;
+	else
+		lut_value = 0xffff;
+
 	red_lut[0] = green_lut[0] = blue_lut[0] = 0;
 	for (i = 1; i &lt; legacy_lut_size; i++)
-		red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
+		red_lut[i] = green_lut[i] = blue_lut[i] = lut_value;
+
 	igt_assert_eq(drmModeCrtcSetGamma(data-&gt;drm_fd, primary-&gt;crtc-&gt;crtc_id,
 					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
 	igt_display_commit(&amp;data-&gt;display);
@@ -752,14 +766,22 @@ static void
 run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 				 bool (*test_t)(data_t*, igt_plane_t*))
 {
+	bool depth_10bit = false;</pre>
    </blockquote>
    <p>This can be simplified.</p>
    <p><span class="ͼm">bool</span><span class="ͼm">&nbsp;depth_10bit</span><span class="ͼg">=</span><span class="ͼm">is_mtk_device</span><span>(</span><span class="ͼm">data</span><span class="ͼg">-&gt;</span><span class="ͼm">drm_fd</span><span>);</span></p>
    <blockquote type="cite" cite="mid:20260531031732.16600-2-jay.liu@mediatek.com">
      <pre wrap="" class="moz-quote-pre">
+
 	test_setup(data, crtc);
 
+	/* MediaTek requires 10-bit pipeline for accurate (bit true) color processing */
+	if (is_mtk_device(data-&gt;drm_fd))
+		depth_10bit = true;</pre>
    </blockquote>
    Not required.
    <blockquote type="cite" cite="mid:20260531031732.16600-2-jay.liu@mediatek.com">
      <pre wrap="" class="moz-quote-pre">
+
 	/*
-	 * We assume an 8bits depth per color for degamma/gamma LUTs
+	 * We assume an 8bits or 10bits depth per color for degamma/gamma LUTs
 	 * for CRC checks with framebuffer references.
 	 */
-	data-&gt;color_depth = 8;
-	data-&gt;drm_format = DRM_FORMAT_XRGB8888;
+
+	/* MediaTek requires 10-bit pipeline for accurate (bit true) color processing */
+	data-&gt;color_depth = depth_10bit ? 10 : 8;
+	data-&gt;drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
 	data-&gt;mode = igt_output_get_mode(data-&gt;output);
 
 	igt_require(crtc_output_combo_valid(data, crtc));
</pre>
    </blockquote>
  </body>
</html>

--------------g8n94wfoYJ00AcxE6RG0hlmi--
