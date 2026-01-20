Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D32D2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 09:12:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA2D10E18D;
	Tue, 20 Jan 2026 09:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SfnLwQvn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0887010E18D
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 09:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768900355; x=1800436355;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Tbd5LJKCdSt5c6FKPQEN1XuUJOiLeI24xulCuR3ed/A=;
 b=SfnLwQvnaQ4zyaVHaB5wmxs540tOV1h0pTSQ8T9K5HyM6yd04cRrDSe5
 KJ8D0idtiQ9dmgS9qKiLRgb/T/qoTcfsmjZSDvuRpzwimCY1QLIzK/TNA
 MpVIf+qjLx3oe/jKyZM6AE/KUUUtwOQnpHofTl2YmSvH86y50xwRvjVBt
 URFKwWYRLFHvNVYSJSMxqbHCDrdCDbMbOLJwzKxYxAlQY8H1vFFkj2ycK
 uL9MPZCm6mzPs2jrAsKhATe1V2+tkb2veT3NPpXKRrhfGyDGOZkcuMPMh
 Q5DWeyOA9IPV7Pj7RzHrmtMK4RvDWrpqvR24V5FwcJvqSrHxje1hPLkXm A==;
X-CSE-ConnectionGUID: BP3VG7LPToWaOJc1VgBpQQ==
X-CSE-MsgGUID: 1xb8iBiXQ1OpObIwbyJNEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70191034"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70191034"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 01:12:34 -0800
X-CSE-ConnectionGUID: jsDI4rOKTli3Ja1Wm8ZyvQ==
X-CSE-MsgGUID: 0oxuAK1xSNyqzOOoCk92kQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 01:12:35 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 01:12:34 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 01:12:34 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 01:12:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0FW3C/120CdMd8BfGWAVE3iPcT/8s2bC6eya7JF0jgbtDCYD4uZp8IlAf1WX5ld39/mIhB13IfitS8aeRZP4ziZJzUDR16da94FrlAbNDnDiQ1DZuA5QXNFrlboeus3bkYzAaEKNhzkEPJJOdRPndEiTJMohk+8EQAD+1fRZfoiMhTfXvpNtWyFORfpMnZcyv8r4J454HzqavdVfVnoG1kZMxS+JIBBXI9aJBYlF8h3HzTp40ysMhDTHCfccXWW1vuBPVhSgMnhSGp1AITJP4mS2+/6eBfF/yT0g8tOF70KjNiOfpfBnbe71D6mWUZ2/YtbQ7ZWLdy2FNenQcsWDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUHNgYJdANCKlUPhkeLC/2ATyZkdPkqXCQL67MFX3IE=;
 b=geVu+oGdxtquzyHZAe5vnTZvcL/JNJ0xpXM2RepbCZUulxw61oYZbW7CIAcgy89cOCSlv/kCcBK5sgDkWC8vwzeIBOVlqZ8rZ3v+Sd/s6jtHn8XfNge3jqNZt/4M/K12uiPTTDO9SuHQYG0MqVHdJ7ykt0IEnQr7bht9XL2LePsFdAIjlVkP6yEcOKM0dLZblpHaRp8AgfMY/dAcSB5LcxULx+RwFylSLucZ7RhNvfu7i7FJM5mVYUTV0XSKYo35ywOppMwiH+Av2Af4SRI21D+1pta/8yiyGHfZJbc8HCgL6GNFHlaVtQNKMBbt1CIWIEpJaCiz2lAPXTPYRMlvBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by CY8PR11MB7266.namprd11.prod.outlook.com (2603:10b6:930:99::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 09:12:32 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 09:12:31 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Topic: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Index: AQHciP7X1P9ibmH1gkqbVBcT/BDFKbVY8OkAgAGgFEA=
Date: Tue, 20 Jan 2026 09:12:31 +0000
Message-ID: <PH7PR11MB679647AEE2E63DF5D675EF07E589A@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260119050732.110985-1-sowmiya.s@intel.com>
 <20260119050732.110985-7-sowmiya.s@intel.com>
 <DM3PPF208195D8DA10DF1B4F032E289199EE388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8DA10DF1B4F032E289199EE388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|CY8PR11MB7266:EE_
x-ms-office365-filtering-correlation-id: 5d4b5cb2-bf76-4272-e95d-08de58040ae3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zfnaHd4mSpcdjTwpytTezQFukX3ylakX5XATDNl42OwDqjttONs+RvJVVKfw?=
 =?us-ascii?Q?8zH7rHQMKAW8pUedVZ77ShGTxtKh8ruLbh0VYJH3FAV0Dl1qsG8ZbTZQry40?=
 =?us-ascii?Q?SXdDJh5XE8O3dXo1p7V0vtaiZKVzrTkjyFC4lqIlGLd0v9Hz8+HMUk0TwVXr?=
 =?us-ascii?Q?OMTfEJVEpcTo5GOzC5P/OhoU/n8qM7ms7vik7VOt5SjrBZ7FY+gwp7h0QlCB?=
 =?us-ascii?Q?Me6ng8+S8cbazj1STw/S93UrhbpUKU7CIFQ5Fe+MiU33wA7+UrJsPLMlkBtz?=
 =?us-ascii?Q?rp4UNph0jrXi+3dFo0VN10rdcQHdD475Vwjk4tvAbSuSfjaSIGpzqFH/DCnw?=
 =?us-ascii?Q?b+yK7f4nAvR/eEtHc5WvG/qXMvqeK3C9jpzT1YBwfx7KhOHzE8VPHOec3Vnh?=
 =?us-ascii?Q?rmSmip8gOww577xkbsXouLS3SaUnJ8pm2/5cZRkhI/GiV2BtIaOfHRX6oLJi?=
 =?us-ascii?Q?8mqFFr40CHssIpkCg2Kgk0zymprSeCDhSVqXSSJIfNlHjwJUceE6OH86TdmE?=
 =?us-ascii?Q?5MPW3S1Sn5GTJEDhFDd9LL6Ml2HZO7lGzo04fYZdJqteqw2bYPksSA7qzgWW?=
 =?us-ascii?Q?HAumsmGrI7mqxcLUdWdYqHqkQjXrr9OftRPIC73lE3KLSzHxY5CUnD8AU0N/?=
 =?us-ascii?Q?PGi5jw5VdAxfFurxULQT8n87l8o8sOInjVuwseyz3Gwx5qCnkcGr30QV+zSP?=
 =?us-ascii?Q?dTbqrFtMdlKDXKv7hBPFZBsSr11ozqaC85pe53WX69eKhVTsPIj/FMEa1RtK?=
 =?us-ascii?Q?xUOgkNfq/i0hbmwno3Z40IKvJxvmOQZCJYN3ihVAM4RndQfOjiOw+fVbjiWJ?=
 =?us-ascii?Q?9daaVLxzb6t12rqh5FGQaZ7xXj0QoKRTC9CXqEpNUI7O83WUTB+n2FanD7UX?=
 =?us-ascii?Q?2RfuMSnP89Cu55HB6tk9sdI7SQu0Lnt8M0wW0qgxvrXsfHb3EHwEcEZSnDFO?=
 =?us-ascii?Q?dH1fOvpYQOTj1HfqOy5Xzdyw4dwkDHerVajdHE06vUNnBIOdG4RHT7Qv3OXL?=
 =?us-ascii?Q?dX+h0X6ehBzvYflcG6Lo2/FKb1SWqApWXMtiiLZNTBIaaIpBaoLD4dPw1Yjk?=
 =?us-ascii?Q?5tPleDGbHOWjxXzCq0CDmOBDgkw59P0deE4PGz5kaQwwCgTBw5hdRTDw+Rrd?=
 =?us-ascii?Q?nK97sYDCg0bPDyO8Tiiy2DzET3/xZARNlLMYt1iVw5+srC1Es3NGG+Jq5kvn?=
 =?us-ascii?Q?kCwwgwob8gjL7i4J5fAFvzB9RVekHlD1S5ikdLhWTqelmX4uoTH+TF9uyHTt?=
 =?us-ascii?Q?45SUuvz4vOp+GuwGY0pJz2qYY5HhtjDWmrXXQeP2DMrvHHf8rL5gwTl11rSc?=
 =?us-ascii?Q?q3VqFLCc5kbTAEwgaP3mGaX38Io0xpCMa4XazG1fYyoo3yurThFsnJjVLjAJ?=
 =?us-ascii?Q?xY0g15YfmlPE0gcPCcO3YieuWqGd6QZZBgu7SHFcyXCLKzySMZmiF3tb3giL?=
 =?us-ascii?Q?i81PQE61gbkZRX8KFIYj3wY9QU2jPZO3aWhMPSIQQYo05Gqv7x5KpGigMZcg?=
 =?us-ascii?Q?U4UClF2qD+fwn/8PdW39PuwCjmZc7kdLpxbsUMle/xU8/LWCJwYlFtlRx4R5?=
 =?us-ascii?Q?OPz106/cNfgveV16nvXXLDqzLGA2BQ9mMsrRRdOLj/ie7aYJgdI17MWm0OYc?=
 =?us-ascii?Q?KtaJ1UD9cA/pE/38h+kPVJs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ejP+dbLKPfwbVKZp/Px5fa8BAr8oxG6YNwBH6kv2lePCDZf76CQCUwPHHbrQ?=
 =?us-ascii?Q?SSWZUpKqf0rUZ5zoNfw+CovVdcYUePx/srg6thwz2KJTFjOHXT3N1XJZBDHt?=
 =?us-ascii?Q?5DewqzrIkZtcqLqf0LhOXwHTo+XhLoF1qCy5FfGBp0bJzc++AFzNwLC7YnCn?=
 =?us-ascii?Q?YY3/T1BAVADCZbtuylLMtCgMPp5ywqBk8hog8JnVEY/lor0T8Dk6TMvaU4Tx?=
 =?us-ascii?Q?SZOpASVmGO+If3fI3hN/USc+9yNjODQsup0BwaUFd73P6kAZVRBOKYy3PlUR?=
 =?us-ascii?Q?fSobOCR6rnd1Zx8PgstkTYgSuwDk9POL2hPMRM6Lo4VdqOwsYcf5xkB+zNjv?=
 =?us-ascii?Q?tOU888VzkYYztwLYIuzhLbVs5y6fXBn1Ci27c/8I4yNu2EEeZUbRPNs2fZPm?=
 =?us-ascii?Q?oF7k0ddlmIKJ/vHKBIyM4WQUGNTuN+IV4B1Je3sBjFg7dSybmtKkqo1ZBEaj?=
 =?us-ascii?Q?gkZo/0temISAwfY4ZXFe+K81kBaOaetaMEektCr8BfPNgbK5GNKVug+vZ6q7?=
 =?us-ascii?Q?d2f97E/d4WvHfqqcM/SZRbc5s2xL+ZytjaCoeRjE0l2xjRLzHCYqSBAvatm9?=
 =?us-ascii?Q?VVypVkubpfjD4gC/9ustcE8b+qZGbUUu310IWNoSdTy2dvM3VHBJoEhoUqGp?=
 =?us-ascii?Q?0XqDu1uEXfmJdZPhi2d9hKbV2stXwuNuDwHgXcD5+peDi9z9ZgQQptyAHREz?=
 =?us-ascii?Q?rf0Hjk8IbHst59I6cwiw7bfrwrT5bOrSgE5dL6vWQ+qkwspqpyYdEOv2Kv2Z?=
 =?us-ascii?Q?kplrvD9rHEnB439XMcLBQYFnkiYqEtw2yOFVPwT8aIW/PJ0ckJ35VQO6zenU?=
 =?us-ascii?Q?JTSisRQc5WaE5S8Dgs37dFf/30vZZDOW8UNtwmcF63jsTtzZ+4pX3Z2J90KS?=
 =?us-ascii?Q?Z3YkKl4LGJUyt30YI7Ds2p2H0gPIQbLd7QG2yYRajnm+V42mKVOWJryRBm0a?=
 =?us-ascii?Q?PW+QwdXAvNVFGdNNhCvhwgSPbJNeGKt7BPBAnQ3Th9I4gDhH0L/gT5JomTzX?=
 =?us-ascii?Q?l4cIUKvJZ+4RIGsCesG+Ot81jOSjU44TpqtXR+gVRITIvzlPCglHiq0yHWyY?=
 =?us-ascii?Q?XZVI8LSg/MfxCzthr2EEH03yBV/V2JDzH3BfbtMCDN88IpNvu1Bdf2Xjea7r?=
 =?us-ascii?Q?z2iCOxP8iibzKs/d7sH6PsPgIpas6+NcvlLOLZRgt/zfTGSv+M4LzSboeuGC?=
 =?us-ascii?Q?tf4WcjxWSWuJVJgZnZuZyqEWALFKxgOQYQ3Xm5G1iIUux0/szSY651N6amHa?=
 =?us-ascii?Q?d0cr2CSc5ihFAs9dW9T+u4IwzH4jXDAKChZNfnatK+ge7Wm649wvUOdABK71?=
 =?us-ascii?Q?DO803qPX+Q5lJqyREjxQKEec7Zu4W2apyVvrDslY+SPGid9rp+2pXALVjrFS?=
 =?us-ascii?Q?Cvzyihcdp+9y+X3Ntso5dsPYZPRxkSQtjPGEt3dXgegfxfZUTxHvfeLB8lh/?=
 =?us-ascii?Q?+EpKPGst1GROCsydhbkCYqcpZb+9bwp51Sj6V8P09Hzhi6H6p74F0ZU2XUGI?=
 =?us-ascii?Q?2JrMXoQP3ysFfFHu+G5Nj2Ywos+3fqwBlTyR/c72YIzTyVCwZLjkVYNkctwp?=
 =?us-ascii?Q?i245FYP+QQeu19V7D13P5OA7SJQZTizDEK07z4yuJtjcauX/MBCIFdmJcuwu?=
 =?us-ascii?Q?Zpkx4b2tA+/dZMc9Q5Ti2jDaBh0afP0SfWqvcgILMR0T2XRV1bLnksZaUBBf?=
 =?us-ascii?Q?6sFQk3Moeec255PJMtLZmOlFAG1SqUThVszAXor7MVFtcOaI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4b5cb2-bf76-4272-e95d-08de58040ae3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 09:12:31.8906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DDB2e5/Mmyn7yBBD73Mx0OwSZPfoOcYt1q/2x6P7wGlksFHZxk9H7FneLyQHxFCNZKqNoczvQ+p322sOXqQ1yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7266
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

> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 19 January 2026 10:37
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: RE: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor writeback=
-fb-id
> subtest
>=20
> > Subject: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
> > writeback-fb-id subtest
> >
> > Remove individual tests for each format for the test writeback-fb-id
> > and introduce dynamic subtest generation based on the formats supported=
.
> > Framebuffer creation was now part of the subtest level based on format.
> >
> > v4: squashed the FB creation function with this commit (Suraj)
> > v5: -Update dynamic subtest documentation (Suraj)
> >     -Rename input_fb to in_fb
> >     -Set plane to in_fb and remove unused input_fb as an arg to
> >      writeback-fb-id function.
> > v6: -Remove in_fb inside subtest and reuse input_fb from
> >      fixture (Suraj)
> >
> > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > ---
> >  tests/kms_writeback.c | 60
> > ++++++++++++++++++-------------------------
> >  1 file changed, 25 insertions(+), 35 deletions(-)
> >
> > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > 63917bf4f..0ed86c865 100644
> > --- a/tests/kms_writeback.c
> > +++ b/tests/kms_writeback.c
> > @@ -51,9 +51,6 @@
> >   * SUBTEST: writeback-check-output
> >   * Description: Check writeback output with CRC validation
> >   *
> > - * SUBTEST: writeback-fb-id-XRGB2101010
> > - * Description: Validate WRITEBACK_FB_ID with valid and invalid
> > options
> > - *
> >   * SUBTEST: writeback-fb-id
> >   * Description: Validate WRITEBACK_FB_ID with valid and invalid option=
s
> >   *
> > @@ -300,7 +297,7 @@ static void test_invalid_parameters(igt_output_t
> > *output, igt_fb_t *valid_fb, ig
> >  	}
> >  }
> >
> > -static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb,
> > igt_fb_t
> > *invalid_fb)
> > +static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb)
>=20
> Also you changing the argument should be its separate patch with a fixes =
tag
> mentioning You are removing the argument because it is not used.
>=20
I'll handle the parameter removal in a separate patch.

Regards,
Sowmiya

> >  {
> >
> >  	int ret;
> > @@ -700,37 +697,30 @@ int igt_main_args("b:c:f:dl", long_options,
> > help_str, opt_handler, NULL)
> >  	}
> >
> >  	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid
> > options");
> > -	igt_subtest("writeback-fb-id") {
> > -		igt_fb_t output_fb;
> > -
> > -		igt_skip_on(data.dump_check || data.list_modes);
> > -		igt_skip_on_f(!(data.supported_colors &
> > XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> > -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> > mode.vdisplay,
> > -				      DRM_FORMAT_XRGB8888,
> > -				      DRM_FORMAT_MOD_LINEAR,
> > -				      &output_fb);
> > -		igt_require(fb_id > 0);
> > -
> > -		writeback_fb_id(output, &input_fb, &output_fb);
> > -
> > -		igt_remove_fb(display.drm_fd, &output_fb);
> > -	}
> > -
> > -	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid
> > and invalid options");
> > -	igt_subtest("writeback-fb-id-XRGB2101010") {
> > -		igt_fb_t output_fb;
> > -
> > -		igt_skip_on(data.dump_check || data.list_modes);
> > -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> > "DRM_FORMAT_XRGB2101010 is unsupported\n");
> > -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> > mode.vdisplay,
> > -				      DRM_FORMAT_XRGB2101010,
> > -				      DRM_FORMAT_MOD_LINEAR,
> > -				      &output_fb);
> > -		igt_require(fb_id > 0);
> > -
> > -		writeback_fb_id(output, &input_fb_10bit, &output_fb);
> > -
> > -		igt_remove_fb(display.drm_fd, &output_fb);
> > +	igt_subtest_with_dynamic_f("writeback-fb-id") {
> > +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> > +			uint32_t test_format =3D fourcc[i];
> > +			int bpc =3D igt_drm_format_get_bpc(test_format);
> > +
> > +			if (is_intel_device(display.drm_fd))
> > +				if (!strstr(igt_format_str(test_format), "BGR"))
>=20
> You don't need to  nest these conditions and can be joined with &&
>=20
Yes, will do that.

> Regards,
> Suraj Kandpal


>=20
> > +					continue;
> > +			igt_dynamic_f("writeback-fb-id-%s",
> > igt_format_str(test_format)) {
> > +				igt_fb_t output_fb;
> > +
> > +				fb_id =3D igt_create_fb(display.drm_fd,
> > mode.hdisplay, mode.vdisplay,
> > +
> > get_default_fb_format(&display, bpc),
> > +						      igt_fb_mod_to_tiling(0),
> > +						      &output_fb);
> > +
> > +				igt_skip_on(data.dump_check ||
> > data.list_modes);
> > +				igt_skip_on_f(!(data.supported_colors & (1 <<
> > i)),
> > +					      "DRM_FORMAT_%s is not
> > supported\n",
> > +					      igt_format_str(test_format));
> > +				writeback_fb_id(output, &output_fb);
> > +				igt_remove_fb(display.drm_fd, &output_fb);
> > +			}
> > +		}
> >  	}
> >
> >  	igt_describe("Check writeback output with CRC validation");
> > --
> > 2.43.0

