Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DAE606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 21:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AfxE8Yaq;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ZwWW0vJb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E170210F0D9;
	Tue, 24 Nov 2026 21:43:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7CB10E9DA
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 21:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795556143; x=1827092143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=X51x9q+LjAt7UmmLNVnEh6BxUgv23Bh+ZSnZCZk1jW8=;
 b=AfxE8YaqnLc4AFvjVhyk7P7BHZ74dbs7dYV47QJcJHIxKvk+WC2xYBMu
 72Tfo3y+JzY8ZF+gqUpYIAZeAK3k/Ggh+Nemont8UYrlciL/nUuNxt+Px
 ncnNN3XJnSaFNqAOSvBwZPVlct0fKrOIZvEWnAVpbLWD96bvFh2ntX98X
 bAtZU/a8jRb+Iol+0/Psewxd+GgnVVp9FWFkvCirVCnAi6HttlN/RN1E2
 Frdp0gKJXLgj2zxsR/Sm+nlXuDBLwpF22c55R8845ezY2/wiiOVVFgQCF
 VqMfm88DypcKhmZX+G8Afuq2ZWfiFAOgE40RpnzIfozs4vzIv4dpGEOCa w==;
X-CSE-ConnectionGUID: w6cA9ASqS72gf9MIpFLs8A==
X-CSE-MsgGUID: xeflJW3hQLucby/XDzoyGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4472960"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4472960"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:35:43 -0800
X-CSE-ConnectionGUID: Y99JlFO0RpaFt+aNaLr4RQ==
X-CSE-MsgGUID: M/vU0XJLT2uxxaHwXfjfvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11583222"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:35:43 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:35:42 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 13:35:42 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:35:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lyyi7FWc38odtM4TgSWsoi+R/7PnRIVO3XFaIa2Oaw1Neh4x6Djzg6t8lEJ2EgrUQTVMhIo2YmdCT2Uq/oA87za3jSpbsBZUCCvzKfECD3rIgwOUjpRPpDdfwt2zOStyg+trl8M9yJwfOfdC8hTWhCORfT1kBgdi7yij3p0WgJvv7qf9Iph83GWFWbJ5yc+QITrz0NMHzYewq5pKCR43+25DYRAanIGk+CJX4yfkNRikTSG7e2ziqVKAYc/zXiaoMyAWYiCvvIv9mNmn65GFfE+20x7Oo8g/ol8wPAk3y29BshomuyWXbziuaQuUF8fQxC4yUE0o5Uih4F7wT+NNNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDeQJU1H+SzIyOOaGcWZCIa18X0+lBdbE8GNz6fS5ro=;
 b=o1gt4zOX8Qsxr3taWKQyqn+vlKTGd6yVxIPj4cKx+YSRv8RsxcpcU9A+73Sd7aztbtiSoSKkiFLXO6G0XaLTNho4DG60qBY04T3PwjQrDxx/5IXZ9yptQtymD/c7T2WXAVNIsIdVzi2wOZcmGfonLHCzUOJh5kGYPih+bMR8uddvpMsxjVffw6Jm8wtq/SqO34t8CFCHDNqlw8euODeRMdLn8DFyqPqb9Y2eDfQ1uLCROcvlEAr6Qa5YDI2Amz8IqH/bFV7dqqKnd8iI0eyoks27pyuMIZ0m+bEl++bit0p5UE7eRCbWRabMj8EJFET46lO1JMMIHnb63fTs7CPFFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDeQJU1H+SzIyOOaGcWZCIa18X0+lBdbE8GNz6fS5ro=;
 b=ZwWW0vJbYzzQyLuPJEY1C4u0qJg05iAjVb0R93iak0sL4+ZYWsU+DYCX2Y6iOV+4qVc0Y4wIrNCKU/zE7tmEPHiG4vaJTZUsyzAzqtvmm+EwMLgCi794k/ji/9KLThVQdchq+xDDrDclspunW337adpoSHmeXFKvIvEtLBecsq4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 PH7PR11MB6954.namprd11.prod.outlook.com (2603:10b6:510:205::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Tue, 24 Nov 2026 21:35:39 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 21:35:39 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 2/9] tools/drm_ras: Add a DRM RAS netlink tool
Date: Tue, 24 Nov 2026 16:35:33 -0500
Message-ID: <20261124213532.3674338-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
References: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0185.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::10) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|PH7PR11MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: db00380a-0af1-446b-035b-08df4a72e24d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|261022075727099003|6133799003|22082099003|18002099003|261009223027099003|261022105027099003|261022113327099003|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261102123227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: ++ZdznKJu4e+yYUFTdNk50KE8IluvV0NaZq/2EjRVKWfhoKvXVfMc2TmX3NcEJaE9A4J5sk9Kyf6ouaLFGDKLQeERoi1er9Ovom2O1POnthJANIjrWG7lU/caqfvwJe621CrKaBh+I1B2X8Zrju7tpaAoZ3bKISfxqbqnUBkEwjJbhY8PQsZTuw+gwk9A8APfCJ7gcaplRZ2grjga95VDBUoJCWwGQENTqWnZB/mWLBhTKbB0S0pQ2IwXQTKSt6zRCfIHzdmllEVErLGIMLD1gwYbzQ2+0vNjYl1/riOEbKLjlQpMWWStObSxur3M310Hd5+iMqUEqZvMmcWEpDNiP5k9UQhifhIQO+ybJZ8PBXxyc02MAyuBpIXDImPYUrnwEi2bGp1LVwkr8rqsiR6d5lI26gcGK3QmdHDZBgKR0UULncPLED+tkZ4MBwuOPglfTkql2seSEQqtrz2/H3HQiPkBKw3hUFuHTb45T+yr73hoInH1isYDXys1Fh0JwNO5796VMGNuSVRjcvtVVy7N4S4NkrJDFMVeHgWw4fosUrUvs69YqBiyiGX08J49o/YyMt2cg+WqPtdcuT/RYNGosnpeD/XmgIYPzGQONjI8lBa2KqtmBGKGi+eBQmzX0k6hKCbMJ5vkaZYJ047LHpQ7YsUcrRfTtG51JAe1iTdJUM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(261022075727099003)(6133799003)(22082099003)(18002099003)(261009223027099003)(261022105027099003)(261022113327099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261102123227099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0Uvbms0aWNnODJLZGo5MUQrT1E5Uk9IRGRGNDV0aXB4eW55U21tRHR2cFh6?=
 =?utf-8?B?b1VtZlh0aldVYTJ1LzRJM0loYWF0c0RhckJhL081d2hWL0Y1SmxxaG85VHMx?=
 =?utf-8?B?SnFINExEdVQxTlVXaytOWGVkU21yYk4xOW5MZWU1aTlUeDNxZTJPRnhIZGF5?=
 =?utf-8?B?ak9NWHBUaGNYc0liQlNaN0N5R1hTUVBUUlhrQ0xxaGE0emdxbXpjdDgzY1p5?=
 =?utf-8?B?R3N3VXVZOHExZWxsSzExWmlVK3BIN0FFRE5ndGlCVmdHTVhJNlJ1SnRkNnZ1?=
 =?utf-8?B?Vkh1ODExWWZxeCtHaFMwRzRCZTNzRHRyTXd2YXVBT3VaRUsvMWsxVDRUcDk2?=
 =?utf-8?B?Qzd2VnpOSHJ1c29OT1VIelJwN2QraDI1L3J0b0l2R3VLK3oyb2dvbHN2NEs2?=
 =?utf-8?B?NHF5ZEthbTFBcitTTzZoeHJ0VXc5YVF0MUtxNXhkbFh5dlVvL291OFJyMWdh?=
 =?utf-8?B?U2Z3V0Z2MzVmeXZ0d3hKTWRDNW0yYmc3bS9uY0lxU2s5YU1Nb2VTMkFRMERI?=
 =?utf-8?B?T0pVZjNXaktpTHNSaW1iV0M3elN6UWFoYTRqdktFUHRlOGxxdHpjcWZvNFNz?=
 =?utf-8?B?bGZlMTNhYTFkc2JxVURCbVFld3cxMEhrZ2g4dXF6Nzh6VHJJaDFGMWxFRWx2?=
 =?utf-8?B?ZUVXVUJJNXZKMVlPNXhnbXYwS3JHOG9xTmZ2d0lRVUJjWUUxTTFsZ245NHVM?=
 =?utf-8?B?c3NJSmU2N1Rlb3hOMDlHWnlTcWZCSVU4L0o2T1VqZWtXcit1a1NiZG92K2o2?=
 =?utf-8?B?ZVhTRFk4NGNneVEwSndxVkJ1MTRvSnk1WjlEUU9YL3RQOUhLQlJBR2lpRWhy?=
 =?utf-8?B?VUFqZkhBYlZLbjMxZit1T3psWXU5Uzg3TC9yNldNRmZCeXp4REF1ai9Gam5v?=
 =?utf-8?B?Y29ZcTNtcTdNbUdzdjEwamlRWWkvNHpuR01HeFgvMWNBT1RLdUh1UDhMNXRZ?=
 =?utf-8?B?a3ZFTE1RWTY4VDZlY0x6dkRiRHhENU43QkVNZFJIQmdaM29rU0NlaUQwcEFK?=
 =?utf-8?B?blQzYkx2clVnUVJYRmlhMmZNQXBOVlgxY25LaFZhZDFhczFYWWI4L3d2aWp2?=
 =?utf-8?B?MkFma1hyQjN0eVJjUlRVYUlWTUdNL08zd045cCt2a3hiU2ZEL2xGQWFoVFIz?=
 =?utf-8?B?T2ZvWHNCdFBPVStiWmdDOEpvSjZkdzZ1Q2w1eGF2QjBuNm1Id3NKUDI2alhj?=
 =?utf-8?B?OGF2enU0bzAvWGN6eG1UczlmeXNNbHU4ekNlcFhNajZTQXptbzFiOVBXQWxL?=
 =?utf-8?B?ZDJybjRGU01iZ3pvRHV6ZXpORnc0U1h4YjgvbFl1VzJkTUJUSTlWNEFEKzVM?=
 =?utf-8?B?UElGRTJyRlZWOCt1Uzg3RDlBeDYwcHlnaml5OWVjMFNuM0JmOGF0K3VzeG41?=
 =?utf-8?B?QUUxUlhNTlRuZ0hFY3BxQURSZS9KSjBvc3BEelN5SGpkUnZsa1BreU1DZnNZ?=
 =?utf-8?B?NDF4Q0xXR25jRGpqOWwzTzZXRXNKZkZBbjh4cFNhUUNJeUVNKzdUM0JGZjQv?=
 =?utf-8?B?bjFZWk5Jald4S0JRcWVCb01iYms2Z0p0bERqUFlISXNjaS9jb0FuZ1FEQk0x?=
 =?utf-8?B?aUJHU3QwQkY3dGY3eUxFMDZScDZ3d3ZEZ0FIdGRRMVJqS2Nxb3VORVJ2ejN1?=
 =?utf-8?B?NmVHek5NRnQ5c3pPZUZsZXFXbEdMbUJEdkdQOFB0S3RQbkc5eERQZFJlQk1a?=
 =?utf-8?B?RnZGQW1KMC8vOGFndUduUXN6S2cvMVFkRUlad0FmMGFycWRlVVpXS01mMmEv?=
 =?utf-8?B?Q0JnOGtHeXJodURZZWJvczhoNVp2M3BtRWd5UEVmTHMrZkYxVDhYQUdZUDJu?=
 =?utf-8?B?cnNGT2JwWTloNkxnNmlwZ0RCNHhsWGZQU0RhVzBFcWlBNGRGVForWUdoTEpn?=
 =?utf-8?B?ck5nS2N2YjNCdmhnMWVJUDVQdGdsZzd0S1Z0OUpPMjBqd1ZFbXpHK2Z5Vmli?=
 =?utf-8?B?c1hpSmNLYkVXamlLQ1htV3F1Z0VOeVNoaWtuREE5QlFSdUdWVHRBVG91OG9u?=
 =?utf-8?B?NS9ZTkJjbHIvTzlDSStZdjdJc0FqSExYbDZqQWI0eFlidHRPSnFtb3BIRDE3?=
 =?utf-8?B?Z2FBWVNWa2kzYjRkT3dqUW9zUjBZTjVvcjdpeHovNktvcTdUNVdUQXZGQ0gv?=
 =?utf-8?B?TlY1alIxeWJCV2xHdEt4N0JvVjB0M3BQNXU3Vm82dSt1K0NWeVRGSGFDRmdk?=
 =?utf-8?B?U3FhUXhrcTZkalZsSHFzODFyRG9aOWM4NlVpaWQ0bEk1Q21xRkdEOEFieU5y?=
 =?utf-8?B?dFVqa1Bub0JUNm5QZzQxd0R2SUNZeWprSElJMnFkVjJ6UG5ndDBJNDdOSU5o?=
 =?utf-8?B?ZXhmWjJTSzVPMmNKdmw0OTlEYmZ4KzF5TXM4blFJZ29MNC9JbFBpZz09?=
X-Exchange-RoutingPolicyChecked: KydSU2WpGIoPRRt5L9S5wFxmtKznk3cHkptpBLgunskDwa+ZT5rXgMF775oezvreV6LlABxMuPWJXFlJamMXb9X2pK0pV8QJoZVO1jtzM2NzGOUuOdOnEDtfvzzIUKY6JC3MjiVxJNCvhwnG0fo21MWMV3F48qM9oF34h8J4M1MYbuAWvuC6YHcteetRhgdaxXB5/s5foZJfxdl3Wj+X/MbjRclEEC8YXDY31Z+Z2sSuG4LFEin7sM6ycYLm9WpVTX3g1/qG9AXoBDltad82Xcs0KqGNBKZy5MF13INy0Fcy0gE01TjvO3cjov+cQbseFzoeYxAFD1+AaQ0XKsroWA==
X-MS-Exchange-CrossTenant-Network-Message-Id: db00380a-0af1-446b-035b-08df4a72e24d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 21:35:39.5457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyqlhYWCS076a+y7McpDYt93QwIgstU3KqcgupsU1iLPRBmq0QdZNRFEXiKyCqLfOWzalebv6hnbo6oRbiwapQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6954
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

List the drm-ras nodes, and show the error counters of a given node:

  # drm_ras
  0	0000:03:00.0	correctable-errors	error-counter
  1	0000:03:00.0	uncorrectable-errors	error-counter
  # drm_ras -n 0
  1	core-compute	0
  2	soc-internal	0

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tools/drm_ras.c   | 106 ++++++++++++++++++++++++++++++++++++++++++++++
 tools/meson.build |   7 +++
 2 files changed, 113 insertions(+)
 create mode 100644 tools/drm_ras.c

diff --git a/tools/drm_ras.c b/tools/drm_ras.c
new file mode 100644
index 000000000..0af1ca919
--- /dev/null
+++ b/tools/drm_ras.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <errno.h>
+#include <getopt.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "drmtest.h"
+#include "igt_drm_ras_nl.h"
+
+static const char * const node_types[] = {
+	[DRM_RAS_NODE_TYPE_ERROR_COUNTER] = "error-counter",
+};
+
+#define name_of(names, i) \
+	((i) < ARRAY_SIZE(names) && (names)[i] ? (names)[i] : "unknown")
+
+static void print_node(const struct igt_drm_ras_node *node, void *data)
+{
+	printf("%u\t%s\t%s\t%s\n", node->id, node->device_name, node->node_name,
+	       name_of(node_types, node->type));
+}
+
+static void find_node(const struct igt_drm_ras_node *node, void *data)
+{
+	struct igt_drm_ras_node *found = data;
+
+	if (node->id == found->id)
+		*found = *node;
+}
+
+static void print_error_counter(const struct igt_drm_ras_error_counter *counter, void *data)
+{
+	printf("%u\t%s\t%u\n", counter->id, counter->name, counter->value);
+}
+
+static int show_node(struct igt_drm_ras_nl_context *ctx, uint32_t id)
+{
+	struct igt_drm_ras_node node = { .id = id };
+	int ret;
+
+	ret = igt_drm_ras_nl_list_nodes(ctx, find_node, &node);
+	if (ret)
+		return ret;
+
+	switch (node.type) {
+	case 0:
+		return -ENOENT;
+	case DRM_RAS_NODE_TYPE_ERROR_COUNTER:
+		return igt_drm_ras_nl_list_error_counters(ctx, id, print_error_counter, NULL);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static void usage(const char *name)
+{
+	printf("Usage: %s [-n <node-id>]\n"
+	       "List the DRM RAS nodes, or show the content of one node.\n"
+	       "  -n, --node <node-id>  show the error counters of a node\n"
+	       "  -h, --help            show this help\n", name);
+}
+
+int main(int argc, char **argv)
+{
+	static const struct option opts[] = {
+		{ "node", required_argument, NULL, 'n' },
+		{ "help", no_argument, NULL, 'h' },
+		{ }
+	};
+	struct igt_drm_ras_nl_context ctx;
+	long node = -1;
+	int c, ret;
+
+	while ((c = getopt_long(argc, argv, "n:h", opts, NULL)) != -1) {
+		switch (c) {
+		case 'n':
+			node = strtol(optarg, NULL, 0);
+			break;
+		case 'h':
+			usage(argv[0]);
+			return EXIT_SUCCESS;
+		default:
+			usage(argv[0]);
+			return EXIT_FAILURE;
+		}
+	}
+
+	if (igt_drm_ras_nl_init(&ctx))
+		return EXIT_FAILURE;
+
+	ret = node < 0 ? igt_drm_ras_nl_list_nodes(&ctx, print_node, NULL) :
+			 show_node(&ctx, node);
+	if (ret)
+		fprintf(stderr, "%s\n", strerror(-ret));
+	else if (ctx.dump_interrupted)
+		fprintf(stderr, "List changed while reading, rerun for a consistent view\n");
+
+	igt_drm_ras_nl_cleanup(&ctx);
+
+	return ret ? EXIT_FAILURE : EXIT_SUCCESS;
+}
diff --git a/tools/meson.build b/tools/meson.build
index 68c31da92..78587ec74 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -38,6 +38,13 @@ foreach prog : tools_progs
 		   install : true)
 endforeach
 
+if have_libnl
+	executable('drm_ras', 'drm_ras.c',
+		   dependencies : [tool_deps, libnl, libnl_genl],
+		   install_rpath : bindir_rpathdir,
+		   install : true)
+endif
+
 executable('igt_stats', 'igt_stats.c',
 	   dependencies : [lib_igt_stats, lib_igt_tools_stub, math],
 	   install_rpath : bindir_rpathdir,
-- 
2.56.0

