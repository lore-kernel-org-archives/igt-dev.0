Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BB4606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 22:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jde+z00y;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=joVvj1f7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1DA10ED03;
	Tue, 24 Nov 2026 22:45:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A80B10ED03
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 22:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795560263; x=1827096263;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wqagLV44staoYRUImsWy6tF7xWleBuF7ZOVrAu0fdT8=;
 b=jde+z00yPZnnKBmkDD6FohN6WA1YvF6sj2H3ybesbWnsMZfa1efKf7Fr
 iXQz3IqwWAsgYIxfQJQAkCO8JbmJEdRii3QGl2iEZg37D+bSIbbwpGjwy
 lJpQJENfKye1rdQRd53cKikezCImiwctnuhYKexNYFGrnu5RDrVa6OtJU
 4xHbzeO5dWuQqy0mKWCC/8JXyDl+ICPkIm1N9/9dOPjHZzd7AtUyNZJ2f
 lAYz3sa04JkaqZY7xy0GU255RCxQBvHmapKonTS1jkjJ7C7uNDCmbEs2d
 PY83lh2psmGlKuoPiU9O+HkdwxRrX9oXo0xarce+20gRv7fLC0PG9aoaI g==;
X-CSE-ConnectionGUID: 3/y3dVS9RvqjxbkmIvgZ+g==
X-CSE-MsgGUID: exAL8XgNTZ63Jh75yLwsew==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4335475"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4335475"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 14:44:23 -0800
X-CSE-ConnectionGUID: u5uxmBbfR6+Lu/ljUNGy0A==
X-CSE-MsgGUID: JkG6CcSmRQqbiYS45RRf0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11709494"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 14:44:23 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 14:44:22 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 14:44:22 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 14:44:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQbKQuzAHMNO1w5fKWXMUqsk0Hht5dJVmcbFwx9r4QBHghkSPLGHyzu25/g+cQ/LYThSm3Q/f+CkepaSN2lnzQ9Rpp3tTx7hWiKMG/Fsu/iJYNKrw3vJuIRwSD+Rp/gSjp+ft0RIIUOoM1q37kKO9b//EQ4PAVQcjBgdajhvxRfAgGvEleBiPVFYfRPzWXqqkAxEViQ6FHnAtc8pXvmHtM6ZQmJPuKcZk36w8O+aQ/EFxLsZhY3j32S81xaO9A6/lusKahx/b6KYEbf/zFV1Go0N3Iv5N3cAHsr5K2pUSVXgZ9LzDpReDkR481J+EGMkZGj6zJPbIUt4lRWjVk41OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xxm2SD7XquGYBWrkqcW+W1ES7ebpnxdG/gTO5Hw3iYo=;
 b=imus5zi5fywH3Wmioen7F4K5dS6Zx42KxxOX2Fx7LYvcQ+PdhO++jzRwC7xF+/kctdcwknWKyrs2hL54pPbO/6rrltxXcWOS2thf+/4rXBe7AWa/7Sse0Ia6Mo67b7F/vxXozIDvAEB/lkXdra4h0jv/mSXCFNxPPibAgj+uFhMlkuw5it99CkmndZhIwcr3dB+tcu/1o+aLagEeT7bOwzIoPkBdqVvfb0Y1PWRIebQG9IAnPAmqfLFaepKF9J6TuG8gyz0g3UlpAoho7mAberOamwsPxmMGqL5Kma+EL857shgSvYJmocFb/Y0fTFxh3An+E3L33X6hrSRJwmmCWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xxm2SD7XquGYBWrkqcW+W1ES7ebpnxdG/gTO5Hw3iYo=;
 b=joVvj1f7IcvZIYe11qB+kzoJNUsMV5QlXbEPObq9BEM1HhIX54v91PlwxGaxlVvvsiQZ9XlmligHtHm0R4coNw0uGN8anB+JzyYu3jVFX2igJFoLztTbW6SrSNorrI77JvvrYX6Gx8kLEqofJA+kInEZtV1G+jq/V8S6TyIKPFE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7256.namprd11.prod.outlook.com (2603:10b6:8:10c::8) by
 CO1PR11MB4836.namprd11.prod.outlook.com (2603:10b6:303:9d::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.14; Tue, 24 Nov 2026 22:44:19 +0000
Received: from DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd]) by DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd%7]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 22:44:19 +0000
Date: Tue, 24 Nov 2026 23:43:49 +0100
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>,
 <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_plane_cursor: limit simulation to first
 and last CRTC
Message-ID: <6kaxrxgm5ukbymyrhvzbynrranyzc6q7yj4nkkai22esuo7ejp@mtj7rxx7c2cc>
References: <20261124062725.952438-1-jeevan.b@intel.com>
 <6676344cae734db2fddb0783bdeb9712a4d0f963@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6676344cae734db2fddb0783bdeb9712a4d0f963@intel.com>
X-ClientProxiedBy: AS9PR06CA0429.eurprd06.prod.outlook.com
 (2603:10a6:20b:49e::12) To DM4PR11MB7256.namprd11.prod.outlook.com
 (2603:10b6:8:10c::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7256:EE_|CO1PR11MB4836:EE_
X-MS-Office365-Filtering-Correlation-Id: 52752d40-b83f-4e82-85d0-08df4a7c79cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|3023799007|11063799006|56012099006|4143699003|261026121527099003|261021121427099003|261028144727099003|261026140227099003|261102123227099003|261009223027099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info: sugXiWd5KYm1kzUcblZF0h304SZQnp6Xzf9Az6XNpqQxbUuTxh0cRRoqr6uvhgcOGtLQbO22X2bVoSRc7EO7rizkAEylnxqDbiaN1Ae3xYYTYPyQ8TXEl0cA9tmPwgJolTGtYdB5wuiU2HT666gCgQd/5OIoBr3S2pbAOJo6pCmpANsUcqIWN+WLpLCh6dy5RY4vcJ4x2gtNrdXPBScVfpDG7BWSbkY1a/ybqZGuycqkZMXWRVxFk+4qQUgHyXluPrY0FbfND+rbTVJONxf0lRduIfdGgshEr9YY9OZQem46PudjHfN84MokrV5Jxce8MH4SecI3mhAeLuh6ggvPi0b1HQnpfCDIodP0ni2NCnZav87nSO/HqJxfrnNRlfuQSLaSCvkqvbBKUEETNjA9XMFCh89Hhd6lXcMe7+R4Z5LSxzTxI6q9RmTFtD9NYzMkmLqJdIJRCdtAwmOeLbXirGfunRN5zljqL2AFM8uq3TSG0Vp6lCzu17O3Ajb3PbBgbNEs8vahaDPxjt9IN1SbH/QkiJChlHlMS43Ell6elQzMPbyRuVw2MiGBVJMS89VZiVMHL3Vtuj84Il0w/HzbMZz+j3CFrn9dm/TntWJ+n6WJc90f0dqXrpVvxLFmRH+8r3RAZB+meGjFvUx9EXg8OdLmtCn//zMsZB6UlDHBlmo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7256.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(4143699003)(261026121527099003)(261021121427099003)(261028144727099003)(261026140227099003)(261102123227099003)(261009223027099003)(261022105027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVg1ZUFTM01Wblo5d2JaMEcxc2VVd05tYTh6YzlOVkRNMnNzemhlajdJOFgx?=
 =?utf-8?B?SUNSeHN0ZkRKVERzc01seU5COXNwSDgyRldTMFJjUmdhVk1oSkREQzZvbjhk?=
 =?utf-8?B?cFZPQktXNXpwWVhGTHZ2NkFpd1RvZmszSHdMTTdDMklkM0VzOHFiMzd0elN1?=
 =?utf-8?B?Y25MdDg4WXg2R1BHb2R1STdnOU9QYmYySllJK2ZFbG44NnBYaWcwQUhNSEhF?=
 =?utf-8?B?d3pSeWlYZk96Q1JIdWZDZUhDc1JLQ2NscUhBTEpKeXRwQkllTXpFWTNjWTZp?=
 =?utf-8?B?bTIzSDFJVXBzbGlaWk9hWVRQVFh6WEpIOFlxR1dyNnptZllNR3lLUlFybGE0?=
 =?utf-8?B?NXlaSGpLazQ1UDNYT2YvWURJUytMK0hVVHJoUVRDQmZHL2V6Z3pJZzZOVTlu?=
 =?utf-8?B?YThyOFdLdXdkMUtYQXV2QjhYYUp6dlFPWmRjeE96N2RJL282VEZDY2FnN1U3?=
 =?utf-8?B?SnYrclc3YndCRFF3Q0h5UFdHOVdjTkVabm0wcnprc2hUOXZ5MC9tTVNRTlFC?=
 =?utf-8?B?dGtBMnByWEpkT3NFdFRDYUU1Ri8xMVo0MS9GUmZBOWtRT29YL3BvSGkyWjZU?=
 =?utf-8?B?dVd5cGtmKzdHeHV0dlB0ZVl4MjVFcEtjOU9waEMxcDJHU2ErRENkZkVhOVF1?=
 =?utf-8?B?Zi9RcGJoU25jcmhOc1Q3NldUNDZzQzhBb1AvNXA3N1lVSHQ5MDRwaTZOakp6?=
 =?utf-8?B?a29TQnJicEFKZlpWWkQ4SWlYcUVsVHNveXFZUjYvSlRtNWpGOW5jNkJ1TlNJ?=
 =?utf-8?B?SlJZUlZBY3FtY3pVMFhDOEdPclZ5Tit5OHlWWEFwaWViSVBXM2pxUzhiWUVw?=
 =?utf-8?B?U2ZxRlcvNHFRVTViRk52cHlualRVbVRDb3RFNS9tcUlzMkpmanIxOUFIbHZs?=
 =?utf-8?B?RWxrQ3JaaVMxdkx0QjlkNXpoeUE0c3VYL3E3K3lmcFFtR3VCOVNUNzhwelJC?=
 =?utf-8?B?eS9tMHRTUEVweEdyVU0yd3Z2a1BSVkxZVXRtd01oZ1NBVjVXMml1b1NCSWpT?=
 =?utf-8?B?b2NSS0VzUDhCajNiL1lmUFZybHl2STlyVHJxdEJhbVo3dEZaZU9jTzY1ZkYv?=
 =?utf-8?B?cjBESWVtUFZuSEQrTzF4RHBQNUI1TEZWZmRjY2dIeWFWcmhseEkvaW5hbjRV?=
 =?utf-8?B?RWRUM1ZwYUxnaUpwd0Q4NkN5b3Jua1BwNDdBSzR2OHJQeDVrcGJTc1VyaEw0?=
 =?utf-8?B?VG9TWmVKNm5GNk16TlI0cDhOc2ZzVm9LZGJvaFY0L0RwOGUwdUFWblp1NlJW?=
 =?utf-8?B?UXpPclN0V2xNazNSQ2JPS0JTdFc0NU9kY1p5bUJXeENpYkVMWGFwdFYzcUJv?=
 =?utf-8?B?bHZBcUt0MllTRnRidnE3Y1NGYkNBenBVLytHUk1WNG92V0pNemFhRzFvMElB?=
 =?utf-8?B?YkVOdzJNSVBiWmc5d3ljdDFYcGtWZGZmQlhBaXNzQW9XM3JGWXRmb3MzSFVY?=
 =?utf-8?B?TThHdGVrNHlJOG9sTlRqeXd3QUhtQjF2VW1NWk51M2o4REREdnhPdUhrbkZ0?=
 =?utf-8?B?Nk5QYWtDNHAvQi9vZ0pGOGQ2SmdoTERtZDJIdGEzN1hBZWUxenBkWHBOV2tH?=
 =?utf-8?B?clh1QVduZW5mSlRmMGVBUG50KzJwTTFqTmFQUWpWSTJrTVdJK2dHeUhscEtm?=
 =?utf-8?B?L25nYzNHdU9IcGxmQ21MTWlISjJEU3Zjc2txUE1DSkFEOXpmWndiVjZrTnRr?=
 =?utf-8?B?T2lhc3FQZjg1bWpUUmRuTzZwVklxWG14Y25iNXNValRydFZ3cCtMOWZJbFZu?=
 =?utf-8?B?cHZYM1VtZUsraHpSUm01eGVnTDZDZnRvWkRxZGlqT05pOGR6WUJwblFhbmJh?=
 =?utf-8?B?QXlYRnNrOE5IWEExdmFXaThEZlcrbUF2d3BlckxlN2hIaGhjQzR3c082R1Uy?=
 =?utf-8?B?L1RnelZGWlpOR1gxSFJJbEUrL3lNV20rQzBROG1aQ01hQkpVY0IrYjlUd2tF?=
 =?utf-8?B?eU1lSlNFWDBDeENZN3hpYmtxTzJmNk1peVVjUldTZjVPcHBPaXpiOTcxUmJE?=
 =?utf-8?B?L092b2FDaWE1NzJqRndQYk1ZS2ZPM2xCRHMzRHppY0hENGt0SnJLZ1FFeDk0?=
 =?utf-8?B?dlpMKzJTTmtMbDRHZzUxMzRMRTZnZWxzTWVRR09lNTY0L1JEekZIZlBIZzI3?=
 =?utf-8?B?Q1ljVDFNMEtwc1ZaWGRFUDZBUllXYmlTOEJGRmhUU3pvVWNXcmcxYjc2c3F6?=
 =?utf-8?B?dGNQaDZiS3AvUmZ4N1RrN3VVMC9nQlUrcUw5aDNtZGtqMFJ5TCtoTXl2akw2?=
 =?utf-8?B?R3hjbld0WGZNdU96M3FKdnRjK2l6cnhFZFk1N0x1YWE1akFJZzQyVTA5d2xP?=
 =?utf-8?B?cWZiVFNlTVJ2eHB2UklpbnJiUGpEWkc1NHcwd1NnS3lpU21hdjNYYms3RVdT?=
 =?utf-8?Q?9S6h4gR8sAh0eVOg=3D?=
X-Exchange-RoutingPolicyChecked: oJJeK/lb6H4qDG31EkUNuRAALvRKwIyIIIxVpXO6a450zldrKOvfOs5DYH7/cKQ/yDdn4MOz0g6pQ8Nj0KqHNLkwAeTyU/ehUzyQv2pB7glsaYX5qvtS3xYsv1yywMSPgWSvfqDHG6WrE3qMV/jzFwgqeA8wolB+Eb78+J7zlu3EkZTK3L1sVHHTrPtTaXBsX9pw0/Nbb8GjySQt6aJEfo2DQKy9GBxUWRwjjcCOgf8TAIW0Dc/1lw/HVKm4UqPsEm1cp5HTVeO37xpNXNFdni1HsJvXbjc2TAeJuGXRaFcUDBMEdtLeOgeAJGHq1zbhooFhucEqCX+lpvtNUyls8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 52752d40-b83f-4e82-85d0-08df4a7c79cd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 22:44:19.1129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2syin5ycD2mKfZrrvJlEntgviMR3RFc8UGCIZcx0IrYw42tCrk5nfKc5XOuY5i0IinBnkc1+gpy2iFB2k2++A6N6TGZ018Flf+pUzgl48xI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4836
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 01:02:33PM GMT, Jani Nikula wrote:
> On Tue, 24 Nov 2026, Jeevan B <jeevan.b@intel.com> wrote:
> > Running on every CRTC makes the test hit the timeout on simulation.
> > Restrict it to the first and last usable CRTC when running in
> > simulation, which keeps coverage while avoiding the timeout.
> >
> > Move the per-pipe validity check and the per-pipe subtest body into
> > pipe_output_valid() and run_pipe() so both the regular and the
> > simulation paths can share them.
> 
> I think you're overcomplicating things for something that should be
> simplified.
> 
> I don't know what to say. I don't think my review comments are being
> understood.
> 
> Below is what I meant, maybe C is the lingua franca. Use the first and
> last pipes on simulation, all otherwise. And keep the simulation
> conditional stuff mostly out of the main test loops, because it
> complicates everything.
> 
> Also Cc: Michał, this is what I meant in my comments to you too. There's
> no need for those complicated arrays with bools.

Looks like I fell for quick & dirty solution with those arrays of bools.
Sorry about that chief.

BR,
Michał

> 
> 
> BR,
> Jani.
> 
> 
> PS. It's untested.
> 
> 
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 4b69f1a17e24..a1111245fb0d 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -284,6 +284,27 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
>         test_cursor_spots(data, size, flags);
>  }
>  
> +static uint32_t get_crtc_index_mask(igt_display_t *display)
> +{
> +       igt_crtc_t *crtc, *first_pipe_crtc = NULL, *last_pipe_crtc = NULL;
> +       __maybe_unused igt_output_t *output;
> +       uint32_t crtc_index_mask = 0;
> +
> +       for_each_crtc_with_single_output(display, crtc, output) {
> +               if (!first_pipe_crtc || crtc->hardware_pipe < first_pipe_crtc->hardware_pipe)
> +                       first_pipe_crtc = crtc;
> +               if (!last_pipe_crtc || crtc->hardware_pipe > last_pipe_crtc->hardware_pipe)
> +                       last_pipe_crtc = crtc;
> +               crtc_index_mask |= 1 << crtc->crtc_index;
> +       }
> +
> +       if (igt_run_in_simulation() && first_pipe_crtc && last_pipe_crtc)
> +               crtc_index_mask = 1 << first_pipe_crtc->crtc_index |
> +                       1 << last_pipe_crtc->crtc_index;
> +
> +       return crtc_index_mask;
> +}
> +
>  int igt_main()
>  {
>         static const int cursor_sizes[] = { 64, 128, 256 };
> @@ -291,6 +312,7 @@ int igt_main()
>         igt_crtc_t *crtc;
>         igt_output_t *output;
>         igt_display_t *display;
> +       uint32_t crtc_index_mask = 0;
>         int i, j;
>         struct {
>                 const char *name;
> @@ -322,6 +344,8 @@ int igt_main()
>                 igt_assert(ret == 0 || errno == EINVAL);
>  
>                 kmstest_set_vt_graphics_mode();
> +
> +               crtc_index_mask = get_crtc_index_mask(&data.display);
>         }
>  
>         for (i = 0; i < ARRAY_SIZE(tests); i++) {
> @@ -329,6 +353,9 @@ int igt_main()
>                 igt_subtest_with_dynamic_f("%s", tests[i].name) {
>                         for_each_crtc_with_single_output(&data.display, crtc,
>                                                          output) {
> +                               if (!(crtc_index_mask & (1 << crtc->crtc_index)))
> +                                       continue;
> +
>                                 if ((tests[i].flags & TEST_OVERLAY) &&
>                                     !igt_crtc_get_plane_type(crtc,
>                                                              DRM_PLANE_TYPE_OVERLAY))
> 
> 
> -- 
> Jani Nikula, Intel
