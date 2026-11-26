Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223AF606A326
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 18:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oGWUy7zW;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=kzX+hnKe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C455210EA03;
	Thu, 26 Nov 2026 18:11:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C529D10EA03
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 18:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795716356; x=1827252356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zjWzBE+cex37QYjwkABcKxjeP7IrAYxsZijLQ7cV/Gs=;
 b=oGWUy7zW1SvMmKa63zGXYtFVjrHx0YlY956zNHql3fwl8mE0E7h9CNf3
 VKR8/cM1tsJ9E12Gwi5Hm0Hdulg6Nc+XK73yd1Yhst0mtHBHXpvyTtJQI
 A6PTW3jHKNDHaeP3lyTlTvi+7qQ3Hs/dgfM9ZJgfGRMnZbp1/oRVoft2n
 OF7eMM7pS9h4Ro6oVF6G7KxxrQEZNY/Xhh550xVQGOW2v3o37JRe11BFM
 aiFcta+ai3LEHxDCDsPfcUbgPOxCj/KsKoz4nUtJ92cCBfXl6p9/ahost
 X01gcm6AgjUv88Gd9hSSGLd79VIb0jFIEwsK/LFBcjWMggscOeMyu5cs3 g==;
X-CSE-ConnectionGUID: kkt+u1pqSuC4TN53yjbZkQ==
X-CSE-MsgGUID: uakLniSbRFiHQ+QRcypmzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4541037"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4541037"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:05:54 -0800
X-CSE-ConnectionGUID: BtF9mDSHREGJFHMHpAS1dw==
X-CSE-MsgGUID: RPbrTGf6QC2q5uP3j8FI1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12560604"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:05:53 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:05:52 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 10:05:52 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:05:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCYvVzhSQPFAWAs3jrN/P1IcqgjQahEv+lPCDtij4luEQsUf8+bEl8XShNyq4kMMQhgbkDvZmdtUyfCjjaEgECC6ZeCD5sG1xW/Z5hGu2Y8YsGY0QPp5SoFU7C8uX7XV0zbg/8VkTgL0EcM+23+PpgP08E4O5jMxqXLJhaBGtF+p45mc2epOExI3v6u7bz+DO+OmJtgn7HHfUOahrTItWm4leBL2SOcjzCSPc8ufextSussOrpSg4V02H/WqJ4GLJRRe4PW7kn1Ge/ShJYMjj5aqrfqEwq3rc4dOCsOWzwiIPHmQAMdWvd4bTJPw7Le9fZSaBSuQiQD//LCz09+lRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pO84XDgaPFKuRf66a31zij3jowzC6/i+jndOoOg6wXM=;
 b=maSyXIHgyC4XZx5Oyr0tK8ZAYb3odQsbChr00h2J5XnalF/BOHR8axXk6eCvrf7MLYJBzqFTaaD0qSROXL8NrEeAqoXXisr8dOOjKqzDSzS+DRCy0QLuOASGU8X+ana2dmCjVvmmTXU3EdFI1seXX+jH066bMz/V+7e6q1a5iOnnLFfMqpio94KUqCH3DQkhs3agi7HHlOgoorVOR0l1md2Y90+NRil6C6knPIPvfECvDNwY43AE71NYjBHkzgLc3nGoNgRU+RJWtuVyF8FLae3l+g4PS4p8E0QvaR6zbXGFRxQ/wOrN93Uh4YhC/lKvYA6ig6iKA1eWYYolG3nkaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pO84XDgaPFKuRf66a31zij3jowzC6/i+jndOoOg6wXM=;
 b=kzX+hnKeKpNOt22fbr2hQwoCocWaixsFrSTJP+GcdRVItbzGX/1gjBF0630HDQyBznAssy09albdYHRRSq+WXZDzH2lgVKiFjfMQjWdpteRRI1u6l28cMSjuZ2Urjj1B1cOeDf4cVlqwUpxkT2l/2lV3pjkAPwZpvhLy7NKHgbM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.7; Thu, 26 Nov 2026 18:05:48 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 18:05:48 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH i-g-t 3/9] drm-uapi/drm_ras: Sync with kernel c95c93b6e26c
Date: Thu, 26 Nov 2026 13:05:37 -0500
Message-ID: <20261126180536.487442-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126180536.487442-10-rodrigo.vivi@intel.com>
References: <20261126180536.487442-10-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0091.namprd07.prod.outlook.com
 (2603:10b6:a03:60::29) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|CYXPR11MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e4deb4-efb3-4628-6fd0-08df4be7e642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261102123227099003|261022105027099003|10067099003|56012099006|11063799006|261026140227099003|261022113327099003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: xLuzcDYoxq6WJgPqOG5GTpKqBmA9VXPVYz5KyOPd8VynGlOLo96eshvqDMgy2TO3wZQp1CNBby0oTK2IpuyGVmACZYnFwMr6/rv+z1UB8zsKbiQ9pe25zv35uFpOydpCdU5p8UqKk9Tq+nW4b+kjir8Ou39sRs7Bvox6fLyaMoY4xxK022aKPFaX9d37j2QAK8tVwOtidrUL7XBQvoe0jbbAsxYtgURMfGti19lGwJX+YvYsb789pMk0VCNtx8KUGcH3knjmBC7/aN0Ce3FC9Qx/dtTHRBDueIvckKlqDIs1EJ13xwOWK0KnElyQOyJEwYIR9CUJKPzK5VpfnwH1Kb/uGRDW6PH55ZUHMaKsduGnMhtSkwan06P9kF079Fc01Lshn0eEpA1V/l+OS4X86mdLP9eyS01ERbCGs7U3GNvnGwjFmt/kc6RiwwrlWxYSNnhlfT7fkOEJ1kNF9ErgV6FxdfP62yeF3Dkva5VcITYE/pNlCGSsfiX6Ai9xhtH30xU2uCVjakDTdQJijettHK3au3FnkopluFfJSkKPV/ZuODfjfromG5kw29DXw4yhWEDrUF1yJq8B+6rbyfGcinfwKgon3lNdFDcunh5z58B9Dre8OQ4ei7RTqkEdXBVXVW2mp3std4HUzJEBflGVYSpCJUSWffVrPqreogGtQ1c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261102123227099003)(261022105027099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261022113327099003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUtTNndCUnNzaEJsTGJkQzZSRHpkUTFIYUtyaVgxQ01tSXpTTmFrNU9mY1pL?=
 =?utf-8?B?WlRrWEJMd2psQXovelVNRTVsUHhMTGtxTmg3UGdaWmw0QVVFWThuMkZTRjF6?=
 =?utf-8?B?NlNRMXhOcENETkVKSlpjTm9SamprZ0RnemNXZnJNSk9UZmVicG5vMlJuOFMv?=
 =?utf-8?B?ZnNteEp5YkxLcmhPZ215SzlEM2l3KzlmWGkrNWMyLzIrYWwzV2pNWEtsNS80?=
 =?utf-8?B?VWtPcnYyM3FsNFJJSWd2S3VHRk1YdXc2alU1TllDY2tLblVSbFRQVXArei9R?=
 =?utf-8?B?QmZjZTBzcjhjMzdVV1RyVnF1UnhiY3JCWVluTEQvN1A4WE1ac3RCVEhTUDh1?=
 =?utf-8?B?NlN6NFdUWnNmOXpwYXNqNE53SjlzUFZyeDhTVVl5SW9rUWdycXhTc1BzUHZP?=
 =?utf-8?B?WExWYndBbFZ6R2huanErZEF1cU0yRC9OWE1rU1lSMEFGM01hSWRXd1NINlBO?=
 =?utf-8?B?ZHVPWElIV1ExYlM4aTRpOUlKZk5zVXFMMVhIaWxZVkZONDBENVFkbHFWdFNY?=
 =?utf-8?B?Y0k5YTJaY24zT0JtUllBMWhzT3AxL1B5VlRNQmVBTFFyYzBYVUdRUUxuOHVj?=
 =?utf-8?B?TFJzTmlmWHZhWFUvZUV3UnFqRkdhYnFTZEdVazY2SGpRVmovbmNWSWVqWlBN?=
 =?utf-8?B?WVRPNjBYS3ZoaXVBN2RwQXhEUzlHblF4VHFiUkhINEhjSzFoL2luNnVidk0r?=
 =?utf-8?B?dVJ3cFQwb0UzZTduakQyMTFsd1ViS3g2Q3E1M2h0TWRXRGtYQUVKemhkbWZD?=
 =?utf-8?B?TWhZa2Q2WDhhUVAvYThMR0FKSHdYaGtQclYxTldOWXBBTzhEZDFBMFhWWDFL?=
 =?utf-8?B?VHhucy9SSHg2cExDKzJ0c2NYNkhBMGNrL2MvdllnRkt6cTI0ZnorYk05ZDlK?=
 =?utf-8?B?anhnd2R5Y211TCtWUUdHQjFhQWgveDczcTJBamNYUGlFTlVaMVhBN29LRXEv?=
 =?utf-8?B?L3NIRTdrcUlXT2pINGx6cGt4RitKdXhUd1d0TWpwMVRZMENqVG5BUndMbThH?=
 =?utf-8?B?WUQ1Ym0xSEV6dHhxUjNBUXB1YUhhNWpGOUhBOTRXQXJ5MWNMaHQ2dWttb0Nx?=
 =?utf-8?B?dS9FbnV4WWpLK0tYSzNvaGY5SUNHU3FtSysvb096cFRkbnhhQ1AwbjhhNCtT?=
 =?utf-8?B?aUU1czBtUmlmbktNSEN4NjZwemdSVUFOSEhLdWgvMnBhZVNBanRlZnVTNUJD?=
 =?utf-8?B?MzJhejZyNXR1Mi9BOFQ5V0VvRWxoMVA0T21HWFhKUmdSM2c3T2ppU2x4QWwz?=
 =?utf-8?B?REhVR2tXaVhWZFhSREg0RXZOYkw1YW9UVXZlVDFBellFcmpVdVNVV0FMeFB2?=
 =?utf-8?B?ckE5QlBOMGdJWUNSM0QzZ1dQL1ZwYk1YcUdlN3cwb3BMTU1mV3FCUzl4NXRJ?=
 =?utf-8?B?NE1jbFZNRW9xNlJXRndzdGNVSDNROGZrdjlOQVlNaU9YdFhiNEJNMjBKQ3N4?=
 =?utf-8?B?QXRTU0xPT1V4QXFUNHpiSjJUaTB6dS9TNmtqT0QyM2FENndBbG4rbkJrTzhR?=
 =?utf-8?B?azdxYkR5Ukt4TXRWaEZhMjBOcDBtQjZIeCsvZ1ZLaVZIUHg1SzZZOGl2SDdY?=
 =?utf-8?B?T3BrS1BzSGl1OXA5Z3EzZGwxNU9jNHEvb1h3aXo4TzVScmNpbCsxTHZBa3F1?=
 =?utf-8?B?a0NPVmUrS2RTT2tOMi9FVS92S2ZIbm50eHU2SitpZnB3MGEySVhLVkhYN3NF?=
 =?utf-8?B?SnFiMkMyd2VOY0M0L3oyTkxJakhDR1NCVGxQYm9IMDlhdy9iRnJIMXZzOVJM?=
 =?utf-8?B?RkE5cm9zQkNubmxLNDhhRHpuZjU3TTg1Y2ZraStBOGgrNngxWWkrcG5pcUQr?=
 =?utf-8?B?Zk55R21LM0ZqV3VzVnBPa3dkN09RWlViek52NEI1ZmlUdDZQMHZ6bHZZYlBU?=
 =?utf-8?B?WTM0QlhhS0VBYnlUMW9JMjR1THo2Um0xby9iUWY1dmFKS2VQeHArMDBvemJN?=
 =?utf-8?B?VWtLTG1GRGxOelhGcWFMQW1xRGZDL1lMUERTOVJOOUk3aVk0L2dyckVFYWcy?=
 =?utf-8?B?NjhxTzhueklBc3h0eVVKNllJNFNsdVF0dWRKSjE1cFAwYlRmWTZxbDdxcVNa?=
 =?utf-8?B?aEc4czh6cm9Sc3h5VXV3V21VY2sva2lYL3lOQUxaL3dVSGxvN29PUDNUM0Vp?=
 =?utf-8?B?bm1VQ3pGZ0VjTlNrQWxmZTFKaFlkTlhrNDBMdDNKQ2w0TkQzTWRzY0NWTE11?=
 =?utf-8?B?QnEwclphK1VTWjduL3N5TjNha1NKK1FKbmhYNG82d1VqMlcyRWJSeUFhaUQz?=
 =?utf-8?B?ODFQVmNaencvQWQyM3V1WWpNQ3QzQ3RZbDZBRk10RW1NRmZObnlDUzkyZzQ1?=
 =?utf-8?B?dWN1TUFOZGVzZ2ltR0tLK1FwMHRsQ0E2eGM2RTJKa1BsVmNRakt0Zz09?=
X-Exchange-RoutingPolicyChecked: elb3TTMERQdqtxuOAM+ZiZU7vFup1rkObzwQrUekQuddnq0yG+5Qdvuq00Xrue8iEr8pF6J8pY1EtI43c9fTmMk3VT5XF8KmPs1THPAemjKa7N0oyyZF49MkDCagWtqyo2kHaS2eFc6bv84KjSulJsZZMkb1tK5t+vtSTgMVEs+BcN+hdqKfj5KvBY4N9lTUrLs53BxglJzck42Ptzd1DT/sOMRLb2lw7rhmvigl021xa0WRO2WcWd09zFpL+XJLV2WJmqSZD7a9fToPyk0SRygjGKrSyQcW9SMKbmmw0cncUUshNmlGSeaulz3fAjTZkm+I4gSU2uFeIcPjIZDbiw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e4deb4-efb3-4628-6fd0-08df4be7e642
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 18:05:48.4357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSQdS7mApoyk9lGAJu3l9K+IvE0M3qYQK+FrYYktE0TJRG41rf64Xonf+wove6aRAjJ3nB2NlfeIaKPWi7X1KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8754
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

Sync drm_ras uapi up to drm-misc-next commit c95c93b6e26c, this will
bring the following change:

c95c93b6e26c ("drm/drm_ras: Extend DRM RAS interface to include
telemetry nodes")

v3:
 - Generate the header with make headers_install (Zack).

Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Reviewed-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/drm_ras.h | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
index 54a4cf2e4..71b342bc5 100644
--- a/include/drm-uapi/drm_ras.h
+++ b/include/drm-uapi/drm_ras.h
@@ -1,7 +1,8 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2026 Intel Corporation
- */
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/* Do not edit directly, auto-generated from: */
+/*	Documentation/netlink/specs/drm_ras.yaml */
+/* YNL-GEN uapi header */
+/* To regenerate run: tools/net/ynl/ynl-regen.sh */
 
 #ifndef _LINUX_DRM_RAS_H
 #define _LINUX_DRM_RAS_H
@@ -10,11 +11,21 @@
 #define DRM_RAS_FAMILY_VERSION	1
 
 /*
- * Type of the node. Currently, only error-counter nodes are supported, which
- * expose reliability counters for a hardware/software component.
+ * Type of the node. The error-counter nodes expose reliability counters for a
+ * hardware/software component, and telemetry nodes expose an interface for
+ * reading and writing telemetry values to a device.
  */
 enum drm_ras_node_type {
 	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
+	DRM_RAS_NODE_TYPE_TELEMETRY,
+};
+
+/*
+ * Bitmask of access modes supported by a telemetry field.
+ */
+enum drm_ras_telemetry_field_mode {
+	DRM_RAS_TELEMETRY_FIELD_MODE_READ = 1,
+	DRM_RAS_TELEMETRY_FIELD_MODE_WRITE = 2,
 };
 
 enum {
@@ -50,6 +61,18 @@ enum {
 	DRM_RAS_A_ERROR_EVENT_ATTRS_MAX = (__DRM_RAS_A_ERROR_EVENT_ATTRS_MAX - 1)
 };
 
+enum {
+	DRM_RAS_A_TELEMETRY_ATTRS_NODE_ID = 1,
+	DRM_RAS_A_TELEMETRY_ATTRS_FIELD,
+	DRM_RAS_A_TELEMETRY_ATTRS_FIELD_NAME,
+	DRM_RAS_A_TELEMETRY_ATTRS_VALUE,
+	DRM_RAS_A_TELEMETRY_ATTRS_STATUS,
+	DRM_RAS_A_TELEMETRY_ATTRS_MODE,
+
+	__DRM_RAS_A_TELEMETRY_ATTRS_MAX,
+	DRM_RAS_A_TELEMETRY_ATTRS_MAX = (__DRM_RAS_A_TELEMETRY_ATTRS_MAX - 1)
+};
+
 enum {
 	DRM_RAS_CMD_LIST_NODES = 1,
 	DRM_RAS_CMD_GET_ERROR_COUNTER,
@@ -57,6 +80,9 @@ enum {
 	DRM_RAS_CMD_ERROR_EVENT,
 	DRM_RAS_CMD_GET_ERROR_THRESHOLD,
 	DRM_RAS_CMD_SET_ERROR_THRESHOLD,
+	DRM_RAS_CMD_TELEMETRY_GET,
+	DRM_RAS_CMD_TELEMETRY_SET,
+	DRM_RAS_CMD_TELEMETRY_LIST_FIELDS,
 
 	__DRM_RAS_CMD_MAX,
 	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
-- 
2.56.0

