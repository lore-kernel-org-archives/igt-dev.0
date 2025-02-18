Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE7FC02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 07:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB49810E2A1;
	Tue, 18 Feb 2025 07:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hxbs52To";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEC210E2A1
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 07:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739863414; x=1771399414;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kCLHyN13mWU59zaEiznAT1OimppUemNE/vUla1u6iBo=;
 b=Hxbs52ToVCQoLGmdIad5o+qCg38Qnmn6p1ubjalrsYOZB5dAD7cgMchr
 GifpU+coFtbfHD3z5Gd9yrJNh4h1+glBsQtSr/cYGQBfdTfJB5tfnpSEx
 Q+9IuODZHmpkTmZklxIxbQ8SxgiPI1TGAfl6WUGfcV/ztwAayquYyRsNV
 CrpaXjPRjZzu845mvuQyw4NhWseh1g+81p8kYCrtefmbgjhQUbt1rR1Wo
 D9Ou3aW7dNwp1u9iFWpmdJSeLjqgtMbJxeIcI1IXgJuEdYijx8l4Z+j0E
 26/4K/6N8zZzcN2SzTOnpUupXjhnMssjIV6FjcYyy/gk0cp69XJd2CIiq g==;
X-CSE-ConnectionGUID: X6C2akOzRhuD6+bLwxI8gQ==
X-CSE-MsgGUID: /Ulbse7zQGKoFdlmQ7PYow==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51531741"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="51531741"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 23:23:33 -0800
X-CSE-ConnectionGUID: ziAK2doPS4qmr1kl45vJjg==
X-CSE-MsgGUID: /Iov9g43SJKdAt5BeTV84Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="119238032"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Feb 2025 23:23:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 17 Feb 2025 23:23:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 23:23:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 23:23:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zy0IZxhhKqUxJB5lWDchFUc+bqBRGY3+/KYoulfdCk/cyWLtQQYQYOWTxfqB7olxM0o+n+LXrKKucOteTqQtCbeIbDrxs2OEKdkDS6kyLQ1oYcInUx2k7h8R9XDhe7T5iAP3X9mCeDksJJpmLQ969uvvFGzsIXu6XSYzhQVka7ziGnpLVczK2uocECym+ru2O5I1yiiA48SpcpfoiooIqIi2XhWMDWLJPR6+E0FgUsMszIgP0Sd/zAwZaPEP3oASMC0tTDERv8g3efHoi4IcySJVrW8z5QbOuoSHtOUQiyrikJWVqHOcuR+CgT/kmBLTcV3OF28xH0PpKbnAsWO+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsnN74IroQDPAiLknbs+GFyK3t5iXfel0bCyzEnXXnc=;
 b=JUyiMTulbyd8ILfUNjiGiyxeFbhpx0YDYnjRryZL70BilSKU/jNBYS7IS/g26MfOjPgcSz+LmpN2V8D64ZQS9y7f0SA//eXoXIkviu4AbRB6JW1av9ln/y//zM/7G4md+h5/564eE0vWUtV9SU03KW9UC53bHXXUzgzqDJMpUFYsbdJLxHyhYAGbfPici96FWgs7tBQVQG8zKMTkB1D3eBcdgzKOJKOTRM7XFIByeYmf+ycn/HHnTT94CzWMDlIqoxkxTfMIZUjWplXa5hUxgDn4tbisYNAJoAELXdB6d6zYz1uxHN/mm70EmmUJAZ2DJwxixo9knQrgedFTBr6wIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ1PR11MB6132.namprd11.prod.outlook.com (2603:10b6:a03:45d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 07:23:30 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 07:23:30 +0000
Message-ID: <e27a3141-311d-4c0f-99f4-bf6ca60e4b38@intel.com>
Date: Tue, 18 Feb 2025 12:53:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_color: Enable ctm-limited-range subtest
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20250214161011.363157-1-swati2.sharma@intel.com>
 <Z699roJnvD0kO4Ne@intel.com> <7f66b930-2061-4204-934c-fee454992ae9@intel.com>
 <Z6-v-I4F2Os8vXCa@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <Z6-v-I4F2Os8vXCa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ1PR11MB6132:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a51c1b9-9b2d-4515-ab33-08dd4fed24f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2Fpa240U2xmMUh1WStGcmlHWm1hYWxuWFVJOVFKR3MweFhDa2JXOUE4Q3Bi?=
 =?utf-8?B?QzNzaXkxazFmNHZmbnBlYzQwZ0RYaHE5Wk9maXpRa1BVWWFRMmFKdkZWVjdy?=
 =?utf-8?B?akdITFg1ckhzY0txTVpmWGJOUGFEenBpQTRNYXp2c29Gb2JNa0xHM3I2WWpP?=
 =?utf-8?B?SWZnQnUzOXpiUHVSOXFyQ1JOVkFvUWl0WHFibWpQZHBHL0p4NEVKY1AvQjhF?=
 =?utf-8?B?RWZDWGh4TVpGWHcyVFpsTjhmbmpGZ1NBM296NHNWVWx3clQwWU5rcUVabzhG?=
 =?utf-8?B?RVlnZnRsTEExOHNDVndEMnp0UUZMcjlDRWpWMWZOWFJXeEZHS1QxTzh3R0J6?=
 =?utf-8?B?M3JuUjhrUVkveWx6NUl3RWVYMnRQS1E4UXBLYTA3RzdLdVhKSHovNUZLU2h3?=
 =?utf-8?B?Q1A4VjVsVStlN01WU3BvMHEvOC91ZVQ2dDVsSldGVFptWWMrOHZKR3diS0Zj?=
 =?utf-8?B?amZON3BoZk9QZVBTc0ZkSCtvWWtWcmNwTzViU2dKRExmWjNZb0drVXcyZGp1?=
 =?utf-8?B?eGt3NU8wYit1bFlNdHllL0pzcXFTNkJ3azlJQkpTSXN1YnJHTmYzUzJnTm96?=
 =?utf-8?B?OGhMaFBoa3ZnWDVIZXpDKzJER1NWUHBQbUtMbTBTVmJld1hib0V1bnFiRWt1?=
 =?utf-8?B?R09ISzVOUDg0TkJEa1dJN2lSVHJEOVdiTUtuSlRPS1ZxaUNVY3VLUnFqZ1p1?=
 =?utf-8?B?SERRaWZWQUJXUVF6em9qQVVheW1Bek15dWU3RUJKQlFVenQvK0k5NnhTcDZH?=
 =?utf-8?B?UUc5eFlsSElLeTFHZzlEN0NGUUhXSmhwcDQyQXI4WHpEcVFxa2o3c21YVWdK?=
 =?utf-8?B?VTJqdmhJcFdqRnJKME9sTCtWZk15SFkxaDJub3N3UkY5c3p6QWRlZ3l5SW5S?=
 =?utf-8?B?cFJyaXRZYXdobzV1eVpzZU8rWVl1eGFEZmJ1Mng0ZjBpQlhpd2VkTEhRLy9p?=
 =?utf-8?B?ZGE1dFUyc1JwWWd0bzA2c1RsazIvU082TVJwTm1vclJGYzdtbmpUU2NhMlQ2?=
 =?utf-8?B?RG9LdDFib3Z4TklUS1pFOUlOMmhrN3hLUGhpbjA0VFRvOTFjbnpvSmpCQnJo?=
 =?utf-8?B?YlNaNDF6YWNKNFZpNmhEQjhXcUJra1lwazltakVzODJVc2pGYVBvdEV2ZzMv?=
 =?utf-8?B?WStCelFnUVZUQ1dVSkVqZHZRYmZLUFlsUCt4NldTY2hGc0JsMHRKV1BIODQz?=
 =?utf-8?B?Tk5IRlY1UjhYMUJLaHhERWM2RmhQbzZNbG82dnpsTXBuS1JqUlhaZ0xWRXBv?=
 =?utf-8?B?MXY1YXBaaHdtQ2NPbE5YZzF3V2VLWUxIc2pabW5XbDgrR2haMDlwQWdyZ1Rz?=
 =?utf-8?B?UVZWR0lvRUM0UFV2WGNLVUpIWmF1d3ZyclczNjkzZ09nb1FKbjZiVno2ZnFW?=
 =?utf-8?B?MU5DZy9FTS9IYXBRUEVwbGJ4VUY4V3R3MnhjWlpYN3Rud3pINkE5Z3hFNDBk?=
 =?utf-8?B?WjhuZ29EZE1sN1ZKcjFNMEptVmtIcjhoKzJCYUdiMFQ1aWNzMXc5NGw5aVBN?=
 =?utf-8?B?eWY1YWZmNk5zbGJBek53Nmo2MjlxOUVGazJPdWloWVVxQmh1UEFLbzd0SnBJ?=
 =?utf-8?B?Ympta281UzhYdFdMc3dqWUJOcDhaQ2hvQ1RaQXM3R3ZRb05RZ29MVUxNbFFq?=
 =?utf-8?B?S1pnSHM4RXBuNmVXU2NaY0h4ZFBmbU1VZForRG5naGFZQ011OVdKcWdqTTNy?=
 =?utf-8?B?TWFEdlA4blhxMFAzNWIyenZpQ0dzN2lwNWRjbnJhUVZOaDNhYVRkREhsZjFR?=
 =?utf-8?B?TXl0SWJwcDl3cDAxNzhMZFN1WkUvWGc5T1Z3dkltbjFoRlNoWUhTVUhncndE?=
 =?utf-8?B?dXVGamlsdTN3VjEvMzhHY0t6VTdQSndHRm51QUZkc3d5a3dVSXA4RDR2L3Rr?=
 =?utf-8?Q?gxW7sfmcS5VuO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXpFYXNBeHVaT250NW11c0lZelFCU2RDTWtnc045VTNKNFRESG9DZ0U0bUlE?=
 =?utf-8?B?YldjTjJQK2pmSTlUMVI0UUtFWGhrWUxqcjk3Vks5VUVBQzl6LzFDOU1SNlh3?=
 =?utf-8?B?SDV3a05EZmkvMTByZmV1SjByUmt0c0FyTkVEL0tMKzNXMWxETHlDcmxjTENx?=
 =?utf-8?B?UUtQbkFONEJDNDltb0xwaFZGMjNZTVFoOVlZbnZnWC9jSCs2cFF0SkRsdWQx?=
 =?utf-8?B?WlhNdW95aGV4NWhmZVNRUjIyVWJPQnJoZXVHQ0dIMm9CdThMbllFV0lRUjhj?=
 =?utf-8?B?VytIdWdWY2NBc0FXRDkyNUN3ZzlBQVB0SmpNTGdPam1ZVmlTelR6aGlHU1FT?=
 =?utf-8?B?RFpQb2Y2cGd0OVR3RFdIdjgzRmNWaVA1Q1pVZXFYTTVqZlg0ZFdkZ1FsbzZ4?=
 =?utf-8?B?K1FNbklMSldSejNRY1pTY0ZObU8rVDJiUVl1NVdtMUxxNHVSSUl5aDJDQjIz?=
 =?utf-8?B?VkJLL2k0dWRnUFVOUUduSU13b04zZUV0NUhybEp2dDYxTHd2K244bW9xN0hF?=
 =?utf-8?B?ZFZrZ3N0MVdESm5zS2cxQmZ0L2Q4em9GRmdNaGI4V1VzVlNzNTlyemMxMHVG?=
 =?utf-8?B?VEJyR3ZsNzhiMXpzRDJHdFdjanpITkFKVk4rTG9UcnJzQjdyeHpxa3VvRDdp?=
 =?utf-8?B?WmRmSHdJQnhENzByVEkxWHZGTkVjWE1sYjlqWjlyZDJSQ2d6VlhzYkN3dUJn?=
 =?utf-8?B?cDdkWEp4eTQwYitRaElTcVdoNEJyeHpTbUZob3hBMmxjRTl1aVkzVTI3OFdz?=
 =?utf-8?B?bzVLdEVISUtUcTQyWE5PY2ZkcFVCeFg1dkRBQnpOYlowWjNwc0RJMjc0bGlG?=
 =?utf-8?B?L0ZuVTVjZFpEajRiVTJhV2UzN0lVTkc2UmpmM3NqRCsrSS8zMkJRSlJac21N?=
 =?utf-8?B?T3NpazM2ZkxBeml5aVpLM3hpcnFkUFc2di9xS1Bia2FjMnRCN2tiemkxNEli?=
 =?utf-8?B?ckNqTzQ5UTVFZTNxWitXcGhzUXpENlJ5T0Y4UEVqL3J6OTltMkxEenJrQTR6?=
 =?utf-8?B?Ly9UQi9zUnlLdE10cjNoSy8zK0FMY1ZNRGhJUXZ6ZGNDNk1QNWJVSWRrYm9s?=
 =?utf-8?B?azNCRFI1MXdmUGlTWjczaHp1ZHNhUytkajhYTEtjU3pvSnM0N2hSSHM1SUJy?=
 =?utf-8?B?UzZxZGhUbG5CTUlyY1F2UGk1c2FNUUw3cVh0bmtlaHhHV0RkWnliay9XMitF?=
 =?utf-8?B?RHJNT1drT0hxc0Z1akJUOE5PdlB4d0YvYzJ1RndHRHRGQ05BTTVpMFhrcy9w?=
 =?utf-8?B?RENJb3J5bnV6YnU0a3hRbDNtSVV2czBNbU53NDk4Lzg0V2tTaDhSZ2VEbmo3?=
 =?utf-8?B?bFRsNzZ1N1U2Z0hweW9EL0t1SnUrcVJ0eFdvbUxQQURtcGpoNDB3MitXSnVR?=
 =?utf-8?B?cVhmTFRjbGpxSE9nbkVYV0xITWo3S0VKWkI3V1NlQjd4dXlUalloRHBsMGMx?=
 =?utf-8?B?anhPdE5SSnZJSVMrNThZVHF1b01VWFUraG0ydG5zZXpBVnFRcUVTQXdjVzRG?=
 =?utf-8?B?RXp1Y2JocEVzT0ZCTmtSOFFzdGoxTlZacm9WZ3RiWUFYcGtxYkVoSFNKOVBS?=
 =?utf-8?B?WTgzbC9OQ2xkUnpZWDhPTzlPanFwS21DUFlDTTJpdlVuOVNNK2NkSkFUM3V6?=
 =?utf-8?B?UElSTmlXQmZCcm9VOXZMOHMrMTEwV3NQMFN1ZStneHhKL0JQaWJzU1hYeE1Q?=
 =?utf-8?B?OERDaVJha1VzVU1BNEhmSEVUSjVmL1BhYis3RWxzNTJmSWNOVDZZRUlkQ1NF?=
 =?utf-8?B?YjVDVWI0Z3VKRFpBSUVmbG1SY1VnczlsY3lnaUZPRktxUmZva1ZPMHNnK3px?=
 =?utf-8?B?ckdMMGVMQWFqSmNna0FvTFd4ZVpOejNRd3V6L1hGVFptY1lFQ2ZZRENHbEVx?=
 =?utf-8?B?TlNtclR1SWFOVFlENTlUeGRQVUJFK3dJc0R4N3h0R205ZmNPRUdJVFhjN25l?=
 =?utf-8?B?T0g1YzB5YjFYV3FPRVlsRFRzYy91QlRTM3JkNXlXUE9pUVVJcEZwRnQ3RXVu?=
 =?utf-8?B?WC9IK0cvMERpUDhVeGw5WHFtQUk5aEVqZVZSSkNwckZ0QklXS3VwN24wUkJT?=
 =?utf-8?B?K3kzd00vSU1aMTI3c1hpTEtudmkyVlV6eWFEblRiVWk2ZzlNTzUrdEUrc0VJ?=
 =?utf-8?B?M3dPSE14cVJ5eHlybDkxT3BUZUZIREhBeGFvNnFQaW5BMEJhVHg2dVROT2wy?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a51c1b9-9b2d-4515-ab33-08dd4fed24f2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 07:23:30.5197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NDKBC1vj9mTK37nmW3FuCxIhZ1Yn53APsRiK5zUTO1xZYtUSZJdQdsoPBdExA9UxEYJEeTwvsfzxQUVJzpPNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6132
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

Hi Ville,

On 15-02-2025 02:34 am, Ville Syrjälä wrote:
> On Fri, Feb 14, 2025 at 11:56:27PM +0530, Sharma, Swati2 wrote:
>> Hi Ville,
>>
>> On 14-02-2025 11:00 pm, Ville Syrjälä wrote:
>>> On Fri, Feb 14, 2025 at 09:40:11PM +0530, Swati Sharma wrote:
>>>> This tests is currently disabled since CRC computed on Intel
>>>> hardware seems to include data on the lower bits, this is
>>>> preventing us to CRC checks.
>>>>
>>>> Let's try to enable it back and check behavior on newer Intel
>>>> platforms.
>>>>
>>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>>>> ---
>>>>    tests/kms_color.c | 166 ++++++++++++++++++++++++++--------------------
>>>>    1 file changed, 93 insertions(+), 73 deletions(-)
>>>>
>>>> diff --git a/tests/kms_color.c b/tests/kms_color.c
>>>> index 4b71d3dd3..c3b285b4e 100644
>>>> --- a/tests/kms_color.c
>>>> +++ b/tests/kms_color.c
>>>> @@ -58,6 +58,7 @@
>>>>     * @0-75:           for 0.75 transparency
>>>>     * @blue-to-red:    from blue to red
>>>>     * @green-to-red:   from green to red
>>>> + * @limited-range:  with identity matrix
>>>>     * @max:            for maximum transparency
>>>>     * @negative:       for negative transparency
>>>>     * @red-to-blue:    from red to blue
>>>> @@ -623,107 +624,97 @@ static bool test_pipe_ctm(data_t *data,
>>>>     * This test is currently disabled as the CRC computed on Intel hardware seems
>>>>     * to include data on the lower bits, this is preventing us to CRC checks.
>>>>     */
>>>> -#if 0
>>>> -static void test_pipe_limited_range_ctm(data_t *data,
>>>> +static bool test_pipe_limited_range_ctm(data_t *data,
>>>>    					igt_plane_t *primary)
>>>>    {
>>>>    	double limited_result = 235.0 / 255.0;
>>>> -	static const color_t red_green_blue_limited[] = {
>>>> +	color_t red_green_blue_limited[] = {
>>>>    		{ limited_result, 0.0, 0.0 },
>>>>    		{ 0.0, limited_result, 0.0 },
>>>> -		{ 0.0, 0.0, limited_result },
>>>> +		{ 0.0, 0.0, limited_result }
>>>>    	};
>>> This whole thing is fundementally broken. We can't generate
>>> limited range output without using the CSC post offsets,
>>> which are not exposed via the current CTM uapi.
>> We do have its equivalent test in kms_color_chamelium
>> and it seems its passing
>> https://gfx-ci.igk.intel.com/cibuglog-ng/results/all?query_key=af49bc8e4e7d1c69ce04f9a1196c167456e8344a
>> Is it wrong?
> Hmm. Looks like the test has nothing really to do with the
> CTM (despite the name), and instead if just uses identity CTM
> and puts the limited range equivalent data directly into the
> fb. So I guess technically it could sort of work.
>
> For the chamelium version the port will chop off the extra
> low bits so I guess that explains why it works.
>
> The crc version is more tricky:
> - g4x presuambly won't work because the port color range
>    bit won't affect the pipe crc
> - ilk-ivb/vlv/chv won't work because TRANSCONF_COLOR_RANGE_SELECT
>    doesn't seem to affect the pipe crc either
> - icl+ uses the output csc for the limited range conversion
>    so the gamma LUT lsb chopping doesn't do anything, so we may
>    get some differences in the low bits
> - hsw-glk maybe could work if we do enable CTM+gamma since then
>    we'll end up doing the limited range adjustment on the gamma LUT
>    and thus it can chop off the low bits. If we didn't enable
>    both CTM and gamma then the limited range conversion would be
>    done on the pipe CSC and thus it would behave exactly like icl+.
So, is there anything we can do to fix this test to enable it back or 
let it be in disabled
state only?
>

