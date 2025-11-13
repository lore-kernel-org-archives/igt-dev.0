Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFCCCD5BD1
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 11:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6784F10E7F0;
	Thu, 13 Nov 2025 11:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCVnTDiL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A322110E7EA
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 11:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763034541; x=1794570541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jwAL82DKVK95kWYH4ckYLGb9t64nYe9WBHBW0WNSP5E=;
 b=cCVnTDiL9FtHuUBX4Do1C1HQiSdvZIlPXakWxZ8r47i01CZxFhr3A7Bd
 N9IQR9l9cc/5FUPfeH8vwH5XgMQ/QqxRNa/a/SFp/cnhAZWMSX1ZL/3or
 Q6MQ2nYBzNenGnoh4bL8/D0y2a67xjIS0nHp3WH8/THZIn7oqJ9EIn6Fy
 6KGKMCxk345uP13dHix63k+uaY96HnXxTE6FbdmSggQA/+bwYEulWGZUX
 XdBcamKNMF+L4Smhx+aiSVdBBl1BviAQmqdyNPc8iwoqjuWompq5/6fwI
 HoQa5s5ETR8fRd5T/iy7gE7XwA3h8OMDUz9FvNhGiiWXpg+dwtyPiEuab w==;
X-CSE-ConnectionGUID: dM/Q9nYbT1+Gike/Ob8YhQ==
X-CSE-MsgGUID: maOy2xLoRyKygYzxUykZhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64819490"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="64819490"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 03:49:00 -0800
X-CSE-ConnectionGUID: BHy3Ocg2Sc6ZwfX0IeQsuA==
X-CSE-MsgGUID: L4FI1ba3RrmXO138a4Q7lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="193733055"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 03:49:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 03:49:01 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 03:49:01 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 03:49:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSFTbQspgD4dddqW48cleNl/0mDKbvdCX1oYzr9pMkkoAKyWHL+TLL5Rdx57oYlPY1ET6oQHe+3YsWn7ZENbDz5NijxlWJVc6rLxp6gPFaJN96NmzjOz50IXUQQD+CYoyG1+wxtGuycdlX3PKiUory77memjWxRYZC5zDq0jn9TVc5YSvhiU53r1tGnTWPKsbekJBOJ4KS3NsI4vM0nL/MGPDGsVm9Ev5n430mt+/nd4mIWQvQ0Xc46l85CwV1sOiAvCSbJxSg4FGN98E5ghIxUPsJ5NwabfuXy/xJb2wVeVcG7/HRXOk2qq4b2e6ZkApbWPyUrlXiEst1OcdXHRtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+PVl+BCDlFhZDVIEfhOmg8F02zQIOv8RU0r9DhZmy4=;
 b=RI52w4SW23tbVdumH+rLZB9r3ZdQ7gx/gWTI2/D7hqTH61up9AZSXE/3is9bWety9UP6oR7b1UNG9ywzWHtNlwV5KV4Yb8AhH1Tm4jBA7hXoaEP7iY712r5CVer9jMJ06k277wXLeBnaGG0soLqBTwrlYTZ+NsE1U1D7vDGYjD4l4M6C/i4iHIjGM5ollQjg2oanzAzqpLYWm6h7+OWq9v5/vJ7YdB1/q4NCV9fjSzuyk6bKu9TLxHLPvjPOgyBDz/NO9Ht6F78rvuWGOSXl5UbSXV3IADa8oDdihuvg/+ZChGaNvtVu5omH+IDwDefLaIHmjKuaDWqT3z0zHKF1Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 11:48:54 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 11:48:54 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Peter
 Senna Tschudin" <peter.senna@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: [PATCH v1 3/5] tests/intel/debugfs: Rewrite tests to use array-based
 required debugfs file lists
Date: Thu, 13 Nov 2025 12:46:13 +0100
Message-ID: <20251113114615.3736269-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
References: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0014.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: c7bf30fe-9b0e-48f7-a25b-08de22aa9f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVdDOTZRWU96VWNNWlNLNk1mek13a3dyQVg4c0huZi9KS21MUHJTakwzYTBx?=
 =?utf-8?B?K1RRekJQQlNlWWpIUGRDRnVYTzN2eXA4TTBYSVlReFRTWnpBSGFJYUQrUkQ2?=
 =?utf-8?B?WXhiWUFKWTNMcCtPRnptMG01K3ZQTEVPNCtJSEFlajlGYUNhSXBoVDRBdVJE?=
 =?utf-8?B?cnlRVUo0Y25UeW9DU0ZqZVo0Z2lqZVQwclBvVEJnYjhBU1d3c3hIMFhZbnd4?=
 =?utf-8?B?bHp1Y0FEQzN5Y1dtQVV2eEE5czlITlRkWXVZVHZjZXQwTWZTRURGOGY3QzdB?=
 =?utf-8?B?VEh5Q1p3ZTJjT3VJZVh6L0hNRExnbE5ob0NlK05wVmdScU5vZGh3OXNtTnlG?=
 =?utf-8?B?VkY4bWxWbEttRTgvaUdybDUyaFU1U3hzc0xhRWhQMGNhald4bDM0elFNU0dQ?=
 =?utf-8?B?YXBma1FLTnFKZjFxamZ4U1NsYWFuSDVFRUFvZ05VczR6OFV2UUorOFprd0p2?=
 =?utf-8?B?OURXOWYzZ1NlL3Z0c2dpWVFPZks0ZDM5am9Eay9SVjdpZmlpc0g3dk1wUGcy?=
 =?utf-8?B?UklJd09kYVZJbndUeCtMY2ZkMDdQUHVFNGhqSllXdDJCeWxiZkRTWERNdXJy?=
 =?utf-8?B?cTNCR09LUFNGd2pXUnZyakZsQXVSKzd2OFlPY29IakZoU3hWUmFrZGpuMFBQ?=
 =?utf-8?B?L2YxSllub3VJSHRBWjN6QlVHeDE0cmhKYmJKR01BVVdWUEZOWng1amhvNUw4?=
 =?utf-8?B?TDVJSGlvUEJRaHBiY01XczVBMFN4S0VVcEQvRTJPS2VQSEdIWW90MEs1YURE?=
 =?utf-8?B?ei9VL3diRW5EOUdRSHY5Nnk1NFpabzVxdmdvaS9ienREcEJTa3lWUnh2NzdU?=
 =?utf-8?B?M0REaGJ1NDBvVlk0bmRJcHorNHpjMStYVDR4Z3FGQUtKSTRXTEVyR1hJSHY5?=
 =?utf-8?B?YmVKaURSWUU2czViQnFlR3phWFppM2FCcEZJeDB5aEZZT0Q3RlZ3WVV6ZkZJ?=
 =?utf-8?B?TEJMdWR3ck5KVVRteXJKSzBoY2R4Vy8zdzlmOTVEMFBNaTdWc3BBNEorNFNs?=
 =?utf-8?B?clZtZW1FdW5YUkhWZmpETmlCRDBhL1dPdTl0a1hVS1huWktkYTNXUW4rY1pw?=
 =?utf-8?B?ZUVKbjJUSis5R1RlSUlybzBDM041c3NZTlg1dWpDeDZMUDlRMisybi9LT3Vw?=
 =?utf-8?B?RVlxandadXJ1QzB1dXBrQUF3b3lsa1NNTkJWbEN4OWdadlRuRXY4eWhZTTF0?=
 =?utf-8?B?YnBRb0tUMHhrQ09PY3FQSU9haTZXelQyY0xyVGZicWF3NjV6UWJobGMxVmx6?=
 =?utf-8?B?L3JKdDJ1WHB1VWJOSTRUOHlJa1huZ0s4THl4U2lHeWoyd3EvVzFxT0N0OHhW?=
 =?utf-8?B?WDVBeFdyUGIzVUtBdWNIWWIvSGFJeUgrekZ5REROeDR0Y09ZOHpnRXI5eGtl?=
 =?utf-8?B?ME5saVFERnJaa1kxMnZ4a2h2NWZ0K1pQaVFEK0cwTTFzZEVLK0dDckNWZjZI?=
 =?utf-8?B?UjRoWFpEVmY2c2ZQaHJTbWNwMzB2TEcvZjhYSVVDaE5rZUZSVW5FUnJLOEY1?=
 =?utf-8?B?cS96MjA4REVrRnJhWlFHK3FpSFFIYXd3UmhuVks4NGlQOUJwV0xobEZMRjl3?=
 =?utf-8?B?dFpuWDFxUWdpVGZ2SnVjd29zcm1lU3Z4MFlNOW9xN0tyTGFQanprOUl6V0FL?=
 =?utf-8?B?UzdpUDVhSHNud1dkMUVMdDVzanlkeUZXNEthbVAzSjhMWFF5cXo5cTVjMysw?=
 =?utf-8?B?M2taSnNnQ0IvaVJBVDlOdzVXdlljTFhzVXo5MDZFZmREcE1vbHZubGxOM2ZO?=
 =?utf-8?B?M1RaY1k4U2dGbG4xMEkyY1JnVjlVMXFJMmRvZ21lOEZKeXhYelhmYmtWRXhx?=
 =?utf-8?B?REhCbS9jT3V4UU9lYTN3d0ZDbXlLalczZVZHZjBRQnMxZnZoTGJwRFcyalR0?=
 =?utf-8?B?MVdzZ2tMNlU5MlNIOENKMkpzaUcyVXhjYVpzeElLNUljaUpZVm9QWDg3UTQr?=
 =?utf-8?Q?aFESUUXEqfLFR4wvVIbv545L3RpHAGNg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2srb2g2Q1pVVTA0dmhGTEgxelkvMjdJMUEwL1JzTkt4QVQwS05oazRHcUwv?=
 =?utf-8?B?SnhGamtOdnJtVGo5QzFpRWxhYWx4SENUOGRsWGk5bW1uK1g2U2s2YUI3ZFhT?=
 =?utf-8?B?NEhBR09IdmFFVWsyOEtFNFpUVUNOckxuajljSUtiWXBvcTZSRTJPVU0zaDFF?=
 =?utf-8?B?VURPK2lSZ0Rjcms2NVRValR2RGREYXpjRnpsSG1ETW9maVdGb1JlaUFVYi9X?=
 =?utf-8?B?K1FpS2tkRjRyZGpoYTNrTGtKVlJLd0tjR0lLcDVSTXN6aXVnUnJSOCs3VStL?=
 =?utf-8?B?aDZSQXRaNWJpc3BOelBlZU0vVnFYMkNQK1Q0K3cvYitmMlRibXpwei9pUFp0?=
 =?utf-8?B?cUt5VTlnUkttTHhKeEQzWnZQODVnUm1xbFNsMDFvMHdLNDQ5dzR3S1BKN2oy?=
 =?utf-8?B?Q2xML1ZJL2dpdGEybFhrNWdYWVZTSnZydnJGRGtpY0tVMDQvTWpNS2U4UmJY?=
 =?utf-8?B?QlZpK1h3YW9CaG1OYVR3S2hQN3lrZFJsaWNGNHorSmUrSHphOTBnTzErYUFw?=
 =?utf-8?B?M21tSWpaOFY4Q2tMSnBMZEFyRnc2UmdWOHdxdHhlMHlldVRhaXV6Yk5GSHBY?=
 =?utf-8?B?azlxTWhtSDI0ekhZRGtlS2xJc1ZFZnNaRXJueWttRXltdHdDZ0xZcEJuZzJT?=
 =?utf-8?B?YnFJMTZPa1V6N1JLOHREQ01ZN1hHODRHS05aY3E3Z2FQWEJSSXd1a0pjc2Z0?=
 =?utf-8?B?SnArUExzOG5vU2JiaFlnRzBON3l5WkZ6SmdnekRNemtpRUpiY3I3WnptUzhX?=
 =?utf-8?B?MWJEcDJ4VHlYMkVpdkQ5UGUyaThWNkhHMi8xU2pkTENhVEwwTkoyNFpBYmJt?=
 =?utf-8?B?anc5dGNsRVJ4QkVlMTZ4TWNDYWc1T3J2ekpVZ3ZmU1Yzd08zMWE5SXdzaU1J?=
 =?utf-8?B?cjc2Y09xcHZGQ2oycDBwZDUxd2hQN21zNTRYNEMvMWpHMUl2emtpZWJVNERh?=
 =?utf-8?B?U09ydjdNV010Rm84NTFmQzd3UlNUYzFSTHBhTjFBaGFrSjgzdXBwQUxWUExl?=
 =?utf-8?B?Uk05VGJ2VmtGOHU5VjNhUElTN0NFc0YyUTFnREdocG5nVGxDYzM3OTRxTUpS?=
 =?utf-8?B?ZSs5L1ZyR0JRVDJxekpWRUFkeXpRajFLd0FOd0cwTkEwQTlkeUtrUng2QVg1?=
 =?utf-8?B?OElpL3RZVnBDeXpmejhaOFNoTDZZS0x4ZzN0SVJidmpINHkzU2ErQ1g3Q01N?=
 =?utf-8?B?M1ZyemVLV2cxRXl4WFkrSnZ3WUxWalhhN3B3VElOYmhmci9heVNzL0RVak1h?=
 =?utf-8?B?bzk5K3hhOVp6ZEYrNTVyQ2tlTXZoNGVhL2ZTUmd0RXRGZFJneWRIeGp5dG0y?=
 =?utf-8?B?UnNpTzJNdUE0N1l4dml0V2JEOFNYMlQ3QkdnMU1NSCtoMjFOaCtVa2w2UFBX?=
 =?utf-8?B?WlYxZ09iWGhyR0pJVCtEdTNEQ253UFdtMUlaMEVuMGdtQnZBT0F5NElZQTBY?=
 =?utf-8?B?MDVLcWZvK2NGalk1Tk5TZnNwVmUrcmFMOTRQVHlLYkFNc2hFZmVWSGdCQTNG?=
 =?utf-8?B?S25lQldkbkdkVWdzeDZZNjBWVzhJeTU4c0lDblFxazFoM09Ya2prRUl5aFBL?=
 =?utf-8?B?WDJIMWdoM0NhMXg0MjJKZXoxUGNJMUEvdzJ6MVpBTDhsMGpOeXNtazBPUTd4?=
 =?utf-8?B?Vm1tak1GVFFvUjFhZ25vTWpiYUxnMkliSnpaQVphTG9rUDZSZ3RTVFhSd1V2?=
 =?utf-8?B?UHRndk5uV2dPdXlydVgvUitGTzFvQ1JGWlRzakdXN3lRRC9XdEV3b3BrWTRS?=
 =?utf-8?B?TnU0bG9va0NvbzlscXB6UVF4SDB5SmpUc2pnSVRTYk0zQ2dvZDIyTlk0WGFH?=
 =?utf-8?B?ZGwzaUhJOElEck9KKzc0UHVXV29yZFlSRWt1MjNoZjF4c0w4UXhlSlFhVG1S?=
 =?utf-8?B?eXVFWjZhRm9EcUQxMWN6c2lrV0EwZ0RlaFZxNVFqQmJmSHErRXZUU2xNUFNY?=
 =?utf-8?B?S3YwL3RmRXBCNDRCajhJT0VlVWpIQVdhL2Zub3pVdDgzZldYb1pPVENsNnJE?=
 =?utf-8?B?bzFLWW9oUERmajdLQzFhM3Q1VHZhaHNrZTFIYStLQ3N0WXJ2YzVldzdNQlpD?=
 =?utf-8?B?aGZIVldweTl3U1puNjBCMW1rb3dPNXhmTEwyMlpQZ3VDOTc1NlBLNnM4YUcv?=
 =?utf-8?B?TlQ1d09kd1dVaGE1djg5YVovTmpLRmJJOFJzY1V5VFdlUVFsMUUvMmpLb09x?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7bf30fe-9b0e-48f7-a25b-08de22aa9f01
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 11:48:54.3144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rb1iYr6yarSW7uYVHJfyQnNkFoChMFTUAq/HmG/jW4XKd1GjK5W9JbznfxuQMput27266dUTTEQf84RbPHMqArwUBTiEZ1cNexg1yEZR8HQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

The previous version of debugfs test contained inconsistent logic.
Lets rewrite the test to use a single array-based list of required files.
Add support for conditional requirements and dynamic index generation
for entries like gt and tile dir.

Also split out a dedicated subtest for validating the contents of the
info debugfs node.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_debugfs.c | 385 ++++++++++++++++++++++++++++-----------
 1 file changed, 283 insertions(+), 102 deletions(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 1005047132..2600880a7e 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -30,75 +30,284 @@ struct {
  *
  */
 
-IGT_TEST_DESCRIPTION("Read entries from debugfs, and sysfs paths.");
+IGT_TEST_DESCRIPTION("Validate Xe debugfs devnodes and their contents");
+
+#define for_each_set_bit(i, mask)		\
+	for (unsigned int _m = (mask);		\
+	_m && ((i) = __builtin_ctz(_m), 1);	\
+	_m &= _m - 1)
+
+struct check_entry {
+	const char *name_fmt;
+	int mode;
+	bool (*condition)(struct xe_device *xe_dev);
+	unsigned int (*iter_mask)(struct xe_device *xe_dev);
+};
+
+static unsigned int gt_iter_mask(struct xe_device *xe_dev)
+{
+	return xe_dev->gt_mask;
+}
+
+static unsigned int tile_iter_mask(struct xe_device *xe_dev)
+{
+	return xe_dev->tile_mask;
+}
+
+static bool has_vram(struct xe_device *xe_dev)
+{
+	return xe_dev->has_vram;
+}
+
+/* Validate the format of debugfs fmt file, allow only one %u literal */
+static bool validate_debugfs_fmt(const char *fmt)
+{
+	bool found_u = false;
+
+	for (const char *p = fmt; *p; p++) {
+		if (*p != '%')
+			continue;
+
+		/* % at end of string → invalid */
+		if (!p[1])
+			return false;
+
+		/* must be exactly %u */
+		if (p[1] != 'u')
+			return false;
+
+		/* only one %u allowed */
+		if (found_u)
+			return false;
+
+		found_u = true;
+
+		/* skip u */
+		p++; /* caller loop increments p again */
+	}
+
+	return found_u;
+}
+
+struct hit_entry {
+	struct igt_list_head link;
+	char name[64];
+};
 
-static int xe_validate_entries(igt_dir_t *igt_dir,
-			       const char * const str_val[], int str_cnt)
+static bool find_no_tested_files(int dir_fd, struct igt_list_head *hit_entries)
 {
 	igt_dir_file_list_t *file_list_entry;
+	bool found_not_tested = false;
+	igt_dir_t *dir = igt_dir_create(dir_fd);
+	int ret;
 
-	if (!igt_dir)
-		return -1;
+	igt_assert_f(dir, "Failed to create igt_dir_t for debugfs dir\n");
 
-	igt_dir_scan_dirfd(igt_dir, -1);
+	ret = igt_dir_scan_dirfd(dir, 0);
+	igt_assert_f(ret == 0, "Failed to scan debugfs directory\n");
 
-	for (int i = 0; i < str_cnt; i++) {
-		int hit = 0;
 
-		igt_list_for_each_entry(file_list_entry,
-					&igt_dir->file_list_head, link) {
-			if (strcmp(file_list_entry->relative_path,
-				   str_val[i]) == 0) {
-				hit = 1;
+	igt_list_for_each_entry(file_list_entry, &dir->file_list_head, link) {
+		struct hit_entry *e;
+		bool hit = false;
+
+		igt_list_for_each_entry(e, hit_entries, link) {
+			if (strcmp(file_list_entry->relative_path, e->name) == 0) {
+				hit = true;
 				break;
 			}
 		}
 
-		if (!hit && opt.warn_on_not_hit)
-			igt_warn("no test for: %s\n", str_val[i]);
+		if (!hit) {
+			igt_warn("No test for: %s\n", file_list_entry->relative_path);
+			found_not_tested = true;
+		}
 	}
 
-	return 0;
+	igt_dir_destroy(dir);
+
+	return found_not_tested;
+}
+
+static bool file_in_dir_exists(int dirfd, const char *file_name, int mode)
+{
+	int fd = openat(dirfd, file_name, mode);
+
+	if (fd >= 0) {
+		close(fd);
+		return true;
+	}
+
+	return false;
+}
+
+/*
+ * Return: negative error code on failure, or number of missing files
+ */
+static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
+				    const struct check_entry *expected_files, size_t size)
+{
+	struct igt_list_head hit_entries;
+	int missing_count = 0;
+	int err = 0;
+
+	IGT_INIT_LIST_HEAD(&hit_entries);
+
+	for (int i = 0; i < size; i++) {
+		const struct check_entry *check = &expected_files[i];
+		unsigned int mask;
+		unsigned int j;
+
+		if (check->condition && !check->condition(xe_dev))
+			continue;
+
+		if (!check->iter_mask)
+			mask = BIT(0); /* to iterate once */
+		else
+			mask = check->iter_mask(xe_dev);
+
+		for_each_set_bit(j, mask) {
+			struct hit_entry *entry;
+
+			entry = malloc(sizeof(*entry));
+			if (!entry) {
+				igt_warn("Failed to allocate memory for hit entry\n");
+				err = -ENOMEM;
+				goto out;
+			}
+
+			igt_list_add(&entry->link, &hit_entries);
+
+			if (!check->iter_mask) {
+				snprintf(entry->name, sizeof(entry->name), "%s", check->name_fmt);
+			} else {
+				int ret;
+
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+				/**
+				 * XXX: We ignore the compiler warning, but
+				 * validate fmt at runtime.
+				 */
+				if (!validate_debugfs_fmt(check->name_fmt)) {
+					igt_warn("Invalid debugfs name fmt: %s.\n",
+						 check->name_fmt);
+					err = -EBADF;
+					goto out;
+				}
+
+				ret = snprintf(entry->name, sizeof(entry->name),
+					       check->name_fmt, j);
+				if (ret < 0 || ret >= sizeof(entry->name)) {
+					igt_warn("Debugfs format failed for: %s\n",
+						 check->name_fmt);
+					err = -EINVAL;
+					goto out;
+				}
+#pragma GCC diagnostic pop
+			}
+
+			if (!file_in_dir_exists(dir_fd, entry->name, check->mode)) {
+				igt_warn("Missing debugfs file: %s\n", entry->name);
+				missing_count++;
+			}
+		}
+	}
+
+	if (opt.warn_on_not_hit)
+		find_no_tested_files(dir_fd, &hit_entries);
+
+out:
+	if (!igt_list_empty(&hit_entries)) {
+		struct hit_entry *entry, *tmp;
+
+		igt_list_for_each_entry_safe(entry, tmp, &hit_entries, link) {
+			igt_list_del(&entry->link);
+			free(entry);
+		}
+	}
+
+	return (err < 0) ? err : missing_count;
 }
 
 /**
- * SUBTEST: xe-base
- * Description: Check if various debugfs devnodes exist and test reading them
+ * SUBTEST: root-dir
+ * Description: Check required debugfs devnodes exist in the root debugfs directory
  */
-static void
-xe_test_base(int fd, struct drm_xe_query_config *config, igt_dir_t *igt_dir)
+static void test_root_dir(struct xe_device *xe_dev)
 {
-	uint16_t devid = intel_get_drm_devid(fd);
-	static const char * const expected_files[] = {
-		"gt0",
-		"gt1",
-		"stolen_mm",
-		"gtt_mm",
-		"vram0_mm",
-		"forcewake_all",
-		"info",
-		"gem_names",
-		"clients",
-		"name"
+	const struct check_entry expected_files[] = {
+		{ "clients", O_RDONLY },
+		{ "forcewake_all", O_WRONLY },
+		{ "gem_names", O_RDONLY },
+		{ "gt%u", O_RDONLY, NULL, gt_iter_mask }, /* gt0, gt1, ... */
+		{ "gtt_mm", O_RDONLY },
+		{ "info", O_RDONLY },
+		{ "name", O_RDONLY },
+		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
+		{ "vram%u_mm", O_RDONLY, has_vram, tile_iter_mask }, /* vram0_mm, vram1_mm, ... */
 	};
-	char reference[4096];
-	int val = 0;
+	int debugfs_fd = igt_debugfs_dir(xe_dev->fd);
+	int missing_count;
 
-	igt_assert(config);
-	sprintf(reference, "devid 0x%llx",
-		config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff);
-	igt_assert(igt_debugfs_search(fd, "info", reference));
+	if (debugfs_fd < 0)
+		goto skip;
 
-	sprintf(reference, "revid %lld",
-		config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] >> 16);
-	igt_assert(igt_debugfs_search(fd, "info", reference));
+	missing_count = debugfs_validate_entries(xe_dev, debugfs_fd, expected_files,
+						 ARRAY_SIZE(expected_files));
 
-	sprintf(reference, "is_dgfx %s", config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
-		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "yes" : "no");
+	close(debugfs_fd);
+
+	igt_fail_on_f(missing_count > 0, "Found %d missing debugfs files (see warnings above)\n",
+		      missing_count);
+
+	return;
+skip:
+	igt_skip("Failed to open debugfs directory\n");
+}
+
+/**
+ * SUBTEST: info-read
+ * Description: Check info debugfs devnode contents
+ */
+static void test_info_read(struct xe_device *xe_dev)
+{
+	uint16_t devid = intel_get_drm_devid(xe_dev->fd);
+	struct drm_xe_query_config *config;
+	const char *name = "info";
+	bool failed = false;
+	char buf[4096];
+	int val;
+
+	config = xe_config(xe_dev->fd);
+
+	igt_assert_f(config, "Failed to get xe config\n");
+
+	snprintf(buf, sizeof(buf), "devid 0x%llx",
+		 config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff);
+	if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
+		igt_warn("Missing devid in info debugfs\n");
+		failed = true;
+	}
+
+	snprintf(buf, sizeof(buf), "revid %lld",
+		 config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] >> 16);
+	if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
+		igt_warn("Missing revid in info debugfs\n");
+		failed = true;
+	}
 
-	igt_assert(igt_debugfs_search(fd, "info", reference));
+	snprintf(buf, sizeof(buf),
+		 "is_dgfx %s", config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
+		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "yes" : "no");
+	if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
+		igt_warn("Missing is_dgfx in info debugfs\n");
+		failed = true;
+	}
 
 	if (intel_gen(devid) < 20) {
+		val = -1;
+
 		switch (config->info[DRM_XE_QUERY_CONFIG_VA_BITS]) {
 		case 48:
 			val = 3;
@@ -106,57 +315,38 @@ xe_test_base(int fd, struct drm_xe_query_config *config, igt_dir_t *igt_dir)
 		case 57:
 			val = 4;
 			break;
+		default:
+			igt_warn("Unexpected va_bits value: %lld\n",
+				 config->info[DRM_XE_QUERY_CONFIG_VA_BITS]);
+			failed = true;
+			break;
 		}
 
-		sprintf(reference, "vm_max_level %d", val);
-		igt_assert(igt_debugfs_search(fd, "info", reference));
+		if (val != -1) {
+			snprintf(buf, sizeof(buf), "vm_max_level %d", val);
+			if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
+				igt_warn("Missing vm_max_level in info debugfs\n");
+				failed = true;
+			}
+		}
 	}
 
-	snprintf(reference, sizeof(reference), "tile_count %d", xe_sysfs_get_num_tiles(fd));
-	igt_assert(igt_debugfs_search(fd, "info", reference));
-
-	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
-
-	igt_assert(igt_debugfs_exists(fd, "gtt_mm", O_RDONLY));
-	igt_debugfs_dump(fd, "gtt_mm");
-
-	if (config->info[DRM_XE_QUERY_CONFIG_FLAGS] & DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM) {
-		igt_assert(igt_debugfs_exists(fd, "vram0_mm", O_RDONLY));
-		igt_debugfs_dump(fd, "vram0_mm");
+	snprintf(buf, sizeof(buf), "tile_count %d", xe_sysfs_get_num_tiles(xe_dev->fd));
+	if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
+		igt_warn("Missing tile_count in info debugfs\n");
+		failed = true;
 	}
 
-	if (igt_debugfs_exists(fd, "stolen_mm", O_RDONLY))
-		igt_debugfs_dump(fd, "stolen_mm");
-
-	igt_assert(igt_debugfs_exists(fd, "clients", O_RDONLY));
-	igt_debugfs_dump(fd, "clients");
-
-	igt_assert(igt_debugfs_exists(fd, "gem_names", O_RDONLY));
-	igt_debugfs_dump(fd, "gem_names");
+	igt_fail_on_f(failed, "Some required info debugfs entries are missing\n");
 
-	xe_validate_entries(igt_dir, expected_files,
-			    ARRAY_SIZE(expected_files));
-}
-
-/**
- * SUBTEST: xe-forcewake
- * Description: Check forcewake debugfs devnode
- */
-static void
-xe_test_forcewake(int fd)
-{
-	int handle = igt_debugfs_open(fd, "forcewake_all", O_WRONLY);
-
-	igt_assert_neq(handle, -1);
-	close(handle);
 }
 
 const char *help_str =
-	"  -w\t--warn-not-hit Produce warnings if it founds a devfs node without tests";
+	"  --warn-not-hit|--w\tWarn about devfs nodes that have no tests";
 
 struct option long_options[] = {
-	{ "--warn-not-hit", no_argument, NULL, 'w'},
-	{ 0, 0, 0, 0 }
+	{ "warn-not-hit", no_argument, NULL, 'w'},
+	{ }
 };
 
 static int opt_handler(int option, int option_index, void *input)
@@ -174,34 +364,25 @@ static int opt_handler(int option, int option_index, void *input)
 
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
-	int debugfs = -1;
+	struct xe_device *xe_dev;
 	int fd = -1;
-	igt_dir_t *igt_dir = NULL;
 
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_XE);
-		__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
-		debugfs = igt_debugfs_dir(fd);
-
-		igt_dir = igt_dir_create(debugfs);
-		igt_require(igt_dir);
-
+		xe_dev = xe_device_get(fd);
+		igt_assert_f(xe_dev, "Failed to get xe device\n");
 		kmstest_set_vt_graphics_mode();
 	}
 
-	igt_describe("Check if various debugfs devnodes exist and test reading them.");
-	igt_subtest("xe-base") {
-		xe_test_base(fd, xe_config(fd), igt_dir);
-	}
-
-	igt_describe("Check forcewake debugfs devnode");
-	igt_subtest("xe-forcewake") {
-		xe_test_forcewake(fd);
-	}
+	igt_describe("Check required debugfs devnodes exist in the root debugfs directory.");
+	igt_subtest("root-dir")
+		test_root_dir(xe_dev);
 
+	igt_describe("Check info debugfs devnode contents.");
+	igt_subtest("info-read")
+		test_info_read(xe_dev);
 	igt_fixture {
-		igt_dir_destroy(igt_dir);
-		close(debugfs);
+		xe_device_put(fd);
 		drm_close_driver(fd);
 	}
 }
-- 
2.34.1

