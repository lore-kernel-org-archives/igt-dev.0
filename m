Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C665E606A32E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 18:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GDHqaEeb;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Ee4VpT8e
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E75112685;
	Thu, 26 Nov 2026 18:15:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F2410EA0E
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 18:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795716374; x=1827252374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7HpTtL/CISfyklfU4aW+NQoSMdEkWFNqjefjeIflwPg=;
 b=GDHqaEeb4j/sIp13otKxPIMCGoWkxDZPSDx91HCrj4pJ9uy7cY2jcL4O
 2xLwjVg/C356cxc6Q+ftOI5d7o37WI8ODOPqstOegk/V1l0kUUq99z9cX
 mmZFJ6/64ciWFQT6PFAmkeIeF0xhEZ5nfQm3RQJm8ccQvB2zDczj5uKeR
 AdtQq+aQu9QGJMbvUtJvZuZFGri/+nJihyVHkz5GDYFqGvUEjJdRgGCfc
 W560nJmq1LCQBgPfJFCPJgeiNcz+YFxNQQdfcU+umLooubwr/Y01BwhmU
 lGm8GXjn2FZ4BSFW3YlHtePgvHTBK8iqXbOUqxIOsxBLVcq36L+3BXIc4 w==;
X-CSE-ConnectionGUID: ffkNVwmaS3muHMwk1wdm/Q==
X-CSE-MsgGUID: mSnvOKysQr2khJTzxJlung==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4541075"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4541075"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:06:09 -0800
X-CSE-ConnectionGUID: 4xnI+lsDQmOyEaWvt7gC7Q==
X-CSE-MsgGUID: hJfnwCp4Rle2pt/+2gZA9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12830232"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:06:09 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:06:08 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 10:06:08 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:06:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jut/aJueB/YG72oVd0aL7eb+3YdzFSQblPA7D/XKZd2DbANWYvVbPDDFNtogZp+a67KSDo0UQDzegX68lKOauRX00C0AxSogmmIXJp3YMzMQnsa7BMG7UdCs5cgU6HPnGxHPW96hL3eJPoocydtYwnWVD7tAQ/AO3lweqQ6+cmwGfmU/tlLni6EnyWtY28fmbv+liYYpsTAWJ6jtbVXNy67ekr9cqUzsP7qQI9dMD42ME9uLxBmVM7NtzObS3DeOBoC5qZ6gMeK0vrN+5oUMH5Unvg6bZA6wP2H8DurMGqwGw2sX2vzG3ZaDMzuW43efwt0xRTU1SYDZfb3h6I7DDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0JqTkmePkyjWb5CCaV8lmscCVjhYkHgTre3EW7AAFo=;
 b=cbJ5YDkViVSJbQC/BgKiH3rwf3QI53JPAkRmT2Xe07nIF9Pw7aCnYROSnA5DDvgaFgpikNzH+XiwQGT5at7r3xcmlNG+PM88iUi7WCQgX+JMv3fw2xNOiXP7oHJibtq+LmT5aUthmQd1oNIkAnVRkX42cmExdJ0FKy4iSPmJFW7pKnS8g81PNgtDALognNT1OTLC/cZEV7avGQp7kam0Yd8t4TO02qgp9YXrOxNDnIYnTOD9yAk7FjSVhqeu/gOccYolR9SJLF82icNIYIxl3wVa/+ALTynfNG3EDsnhEnG9Jc8yBUWVDf1ihMu9brrTIOXTaL+DdoAAjJ5y2WKlYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0JqTkmePkyjWb5CCaV8lmscCVjhYkHgTre3EW7AAFo=;
 b=Ee4VpT8embca2TRB2e9ovq+0DHU78uDnEq/AyfVULjFg3Ku0Gr8nr2R7aPDfea1olrTE6YwpjwEPedWxbeJJQ/3QvW/7ufGW4vVEtmZ3Zso7fcdIlaMp52sPxkuVZCo6LMxbvnGTdFf1WnxiSpSNTDHbExIpycyPF8CGjH8poTQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.7; Thu, 26 Nov 2026 18:06:04 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 18:06:04 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 9/9] tests/intel/xe_drm_ras: Test retired pages
Date: Thu, 26 Nov 2026 13:05:43 -0500
Message-ID: <20261126180536.487442-18-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126180536.487442-10-rodrigo.vivi@intel.com>
References: <20261126180536.487442-10-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::29) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|CYXPR11MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 438a120b-60f1-47e5-eff1-08df4be7efbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261102123227099003|261022105027099003|261022075727099003|10067099003|56012099006|5023799004|11063799006|261026140227099003|261022113327099003|261026121527099003|261028144727099003|261021121427099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: ffjxJO5uPHFIXRtlygODv69TCh8hB9hVNY4thnMWlLElkjrE1YbMd88Lnr4NGEWB/kb9DJAwKueI/xTdajfc8/AhA9bYlbxPR7mjYqGtcKxVSUNeD/C4YZ703WCHQUveFQmHtIy5CplbBgj10bjn8EslerLFp1nIFSO7KZIlQm4FNkpEUGaXXEY5WAcQMPifOCAtnzsGBbPD9Nqgg8UM2F/cRdb/EyCko4NLp8OviKgVyEGg5ZvfEUbs4YQf+5IKv5Svjpj4sMjXu+Fy4JtI1TMwJuemV8VCIgsQsTzmP/QDw0gr/AB+uaD2xFtYcYqZ0kKp+ICNz+huIPlPYpljiUt3CQSlp7VgqNTQOEOhMJqRu5gdcBPEYn+uE/Q1iO+0Shife67qVaZSDGhcwMJvS3Bw+Zwo8YO1iA+kP9UT1ArJ14vjAlUavh1e2XB97nZIRsZDcl36WOXFlAXah+ixi2A+sV3VgaMjfW5D6UfM6QswowiqaXgJDWEvI7B+yMb80FgjpXgwPxJg+3obgnSqX7A0VjM22Eo4wBV8t1hvdVC6+opiQ79mbQC9+RZRh5w4saiRb7bD7xkipCy2VuMaNqQJ7t/AjO3DtEXMf3kY5jp9Hejhpy1L+o1pADlbe2JIp7yOHg1CLwH00bgrNlNK7W4Q3zbS45R5epZh/Pb8ZEo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261102123227099003)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(5023799004)(11063799006)(261026140227099003)(261022113327099003)(261026121527099003)(261028144727099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVZldllsOHBkWWFOMDZ4MVJjUWxVb252eGJjUU1NbmJoUnh0K3VzSnRodTFS?=
 =?utf-8?B?aXAyZnRCUitxMmJBTW9ONGMwblR0VXNMQ2V4bTErVGhnekRJU0tCUHd5Sncv?=
 =?utf-8?B?blZkZDlIZXU3S2lIeXp4Z2N5NEJUaGwyamN1eUVqR05JQzhZVWhyL3VWQUlj?=
 =?utf-8?B?L3RKVnluZlZwRUkrK0ZQbmRIMkJkdGVqem1XS0pUSE5GQkNRaTNDS3NFRnVC?=
 =?utf-8?B?bzhKaXBBVy9EQ3BkN1EvT2YzY0xGclJWblpsQ285bGUrdHU2TUJQN205ODhS?=
 =?utf-8?B?TlBMRnVycXNyQXFVbzVoWFltcVZvVGx3aHprdThSQXlDVzgrL2d4dnIyZW1N?=
 =?utf-8?B?RUkyWElMNENuelQ5SjhUZjM1R0xBZ2RmQUdXZDBpN2dBZEhqR0JUUncxUlpC?=
 =?utf-8?B?SWowQ3lSL2ZlN0YyRXU0dUc0cDJHbERXRkhVZS9PUFFZOHc2UkNudlB5ZXRn?=
 =?utf-8?B?cjltZXlXdDBENmRIS2RObVdLN2ZLeUJaWnZLbzc4ZGlYbGZFYytZcmtTQkhS?=
 =?utf-8?B?MG1QSFBEVDFTbXpJT1JVaytiaHVnVk9ieHN2NDlFTkEwNHBzYmhoNXpzaS8v?=
 =?utf-8?B?eUwwK0Q4SGdBOHFkcElnamdqRnUrVXhRbUc2Zk4yM091eW9mU0E2ZlQzbm1m?=
 =?utf-8?B?ZDJ0c1JDNEZIZHZidm9ZdTdaR3lUcStkeEhpMUVBS1FDa3BEWGQxSUZNQ3M4?=
 =?utf-8?B?M09sM1hXeDVpdWt0ZDhTRHRYa0FxbFZDMVU3UVRDdnpET2lBMDZ0UDVMK29O?=
 =?utf-8?B?eGwvWHpKQ1djTkMzQ09SVGdjcjM2QXFDZFdrd1VBaG1kWEtyZ1lwWEdpR2NG?=
 =?utf-8?B?clhrYW9QamdTZzA5QUtnU1plN2ZwRFVCODJKcnBYUEQ4UlMyWEVXWEUvYUpG?=
 =?utf-8?B?WEQ3UVNibEtCZmNPTWJtb2tnc0hlaHNTTVYrcVArblBuaEs4dWJVZGttMVRm?=
 =?utf-8?B?VXhJejFzSm1FNzRoY0RSckRwb2s2dWpZNmdiZFZRUTc4alZpekN2cE91Umk5?=
 =?utf-8?B?Q003aVNOeVh5MVhIVnZuOEFlVXZhb1VZMUNBYWJjNHVoMTlqQ2J4ZlFMelI4?=
 =?utf-8?B?a0lTZXZpaGtLdHBFUEdKZjhjVmJsTXFiWStZTXo2QVZicnFMSXR1TlFDSzQ5?=
 =?utf-8?B?YlFYUlM3N24xQVh0K2w5cFJmZVJ2ZjlKek9rU2o5Q3JLWUpmRC9hSHFkc3dO?=
 =?utf-8?B?M2cxOUVxeld6dnh3V1dUVHFBbS92aHZRZzJwRitnRjE3TmtDSGYyZEtRbjNI?=
 =?utf-8?B?Yks3alE0OU0zTnVncjZyeTZGQmRuOTU3NHc4S3FlMktRNzhiTmFSV1RITCtH?=
 =?utf-8?B?L2hSd1RCcThmRC9iL0NJNWg4cW41am9pMWtrMDhRc1NteCsvQk9pL3Z2NHJi?=
 =?utf-8?B?SlBSdEcyRXRzd1BLWUl3WXdZSXU4K0g4cUw4bnJkcmR0SE9qdG5NZDAzMU5F?=
 =?utf-8?B?UHpvR1VtdkVXaDhnNjBSaSt6THlDb3hxR1pLdGJ4c2txWUdURG90Z3pjM21W?=
 =?utf-8?B?R1VxWm5aTHZ5QytSdWo1NnQzd3hiOEN2WmwyUjduRUU0WFJ4RzlXOTdzQnZy?=
 =?utf-8?B?VzVVTitFc2orRTdoOTBlZHNZQjNoVmptRXBDZFZLajFrTUk3ajNWOVRYdVp0?=
 =?utf-8?B?bHpOelphNzRXY0s3REsrNVZoTDZQOVRQN1NLR0tpUWJBTGlJVGkrNTdsaUVL?=
 =?utf-8?B?UG1EckJ6MHhHWVFxK1Rkc1YwcWoraFpYQkdNUHIzaDRjWlA0WlNEblVMY3ox?=
 =?utf-8?B?aXhpcXZCWlJPOVJMdFliNTl0Y3R4VVJpaS96K1BnT2lVRlBDQkNsZEVOUnBY?=
 =?utf-8?B?YmhpNkYraEhrbEhRVDlVODFPTUVTREJ4RUIrWDZwS2dlMEppWlByQ29tb2tQ?=
 =?utf-8?B?dithZ2tENmNMVlcxWkVObGRxY1l2eXJpenJ3elRvS0N6ZUNwY3Iwd3AzdFBp?=
 =?utf-8?B?eGMzVnM3ZEYwODhkQXZnaEwrUkR2ZTFYUnhTbVRjdEVvaHRUeURpcVl0TFlI?=
 =?utf-8?B?T2wwemRaSmFLdGtGaGUxamFYQ0FxbU51SXNsTXZLMnlabllaOUZnaXJQSlAw?=
 =?utf-8?B?TEZTeExqMnBkbmJQT09icThidGJTdjRGTFIwZERsbTR6amVINmZTNUJpWUxW?=
 =?utf-8?B?b0RDOXJ3OFllZGFhNzJoL0MwdjE2OUE5N3ZacmUwdEtVd0xyZWFtYmpibStF?=
 =?utf-8?B?TlBUL25aaFV0N1hjbGxmWTlCaGwySzV5S0hmSHdoNlhjQ0lFUmZDdzhzZzhx?=
 =?utf-8?B?NzN4eWZVcHdKWnVsS3E5enRhMjlDaGxhS1ErWWo1RFM3ZXROeGFJVXhIbmtP?=
 =?utf-8?B?bjB1NnBDaHFEbHFjb0lsaU1MTnZZN2RTODBkbmMvUFBhenNhWFRzQT09?=
X-Exchange-RoutingPolicyChecked: T79jwQz/jJaW+dLYCUkS2fx2Ijp60ZVeFgDH10fTFilGAkeOVtyW+D6eXu1K0+Niz1MWy9g7inlPwQQAhMgL6H1/JL/8K7DFVUYw8aF0IhPin4viR479SykaopZq6qhBJs4/Uo6zoAn0+TlddAfHAiLCABwzyCGWOXWD2121+fmJ3OGYbZlK+McVnBD28wFyOW5JQmtnFYd/6+YEr9vS0IcbUwVi6Pf4fsUVqK2AnUGHAM/9pcxC57GOYa0XQcdxvi79OUtiiYkw4GVwBXMpqEXytjcHecOGFIYke+7zuCw9YfnVj8+uO/no20GadP07ARNgVxGQcrmbHXWsQ971Sg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 438a120b-60f1-47e5-eff1-08df4be7efbd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 18:06:04.3113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzrAdTC5GRs/ObVWLlU53jVr+gprbF19quOR2WnuSXVNMTdKac43WwJsqThSDEbu4qReIMW/S126nj+cUx/J4A==
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

Check the retired-pages node of the device:
 - retired-pages-info: the node reports a page limit.
 - retired-pages-inject: pages injected through the VRAM page fault
   debugfs interface are listed over netlink, in address order, exactly
   as in vram_bad_pages.
 - retired-pages-invalid-node: requests on an unknown node or on a node
   of another type fail with -ENOENT.

Tested on BMG with simulated retired pages.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_drm_ras.c | 218 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 219 insertions(+)
 create mode 100644 tests/intel/xe_drm_ras.c

diff --git a/tests/intel/xe_drm_ras.c b/tests/intel/xe_drm_ras.c
new file mode 100644
index 000000000..4803623c1
--- /dev/null
+++ b/tests/intel/xe_drm_ras.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: DRM RAS netlink interface
+ * Category: Core
+ * Mega feature: RAS
+ * Sub-category: RAS tests
+ * Functionality: drm-ras
+ * Test category: functionality test
+ *
+ * SUBTEST: retired-pages-info
+ * Description: Check that the retired-pages node reports its page limit
+ *
+ * SUBTEST: retired-pages-inject
+ * Description: Inject VRAM page faults and check that the retired pages
+ *	reported over netlink match vram_bad_pages in debugfs
+ *
+ * SUBTEST: retired-pages-invalid-node
+ * Description: Check that retired pages requests fail on other nodes
+ */
+
+#include <fcntl.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "igt_debugfs.h"
+#include "igt_device.h"
+#include "igt_drm_ras_nl.h"
+#include "igt_sysfs.h"
+
+#define FAULT_INJECT_DIR	"inject_mempage_offline"
+#define TRIGGER_FILE		"inject_mempage_offline_trigger"
+#define VRAM_BAD_PAGES		"vram_bad_pages"
+#define INJECT_PAGES		5
+
+struct nodes {
+	const char *device;
+	int64_t retired_pages;
+	int64_t other;
+	uint32_t max_id;
+};
+
+struct pages {
+	struct igt_drm_ras_retired_page *page;
+	int count;
+};
+
+static void find_nodes(const struct igt_drm_ras_node *node, void *data)
+{
+	struct nodes *nodes = data;
+
+	nodes->max_id = max(nodes->max_id, node->id);
+
+	if (strcmp(node->device_name, nodes->device))
+		return;
+
+	if (node->type == DRM_RAS_NODE_TYPE_RETIRED_PAGES)
+		nodes->retired_pages = node->id;
+	else
+		nodes->other = node->id;
+}
+
+static void add_page(const struct igt_drm_ras_retired_page *page, void *data)
+{
+	struct pages *pages = data;
+
+	pages->page = realloc(pages->page, (pages->count + 1) * sizeof(*page));
+	igt_assert(pages->page);
+	pages->page[pages->count++] = *page;
+}
+
+static void netlink_pages(struct igt_drm_ras_nl_context *ctx, uint32_t node,
+			  struct pages *pages)
+{
+	*pages = (struct pages) {};
+	igt_assert_eq(igt_drm_ras_nl_list_retired_pages(ctx, node, add_page, pages), 0);
+	igt_assert(!ctx->dump_interrupted);
+}
+
+static int cmp_address(const void *a, const void *b)
+{
+	const struct igt_drm_ras_retired_page *pa = a, *pb = b;
+
+	return pa->address < pb->address ? -1 : pa->address > pb->address;
+}
+
+static void debugfs_pages(int fd, struct pages *pages)
+{
+	struct igt_drm_ras_retired_page page;
+	char *buf, *line, *save;
+	uint64_t pfn, size;
+	char flag;
+	int dir;
+
+	dir = igt_debugfs_dir(fd);
+	buf = igt_sysfs_get(dir, VRAM_BAD_PAGES);
+	close(dir);
+	igt_assert(buf);
+
+	*pages = (struct pages) {};
+	for (line = strtok_r(buf, "\n", &save); line; line = strtok_r(NULL, "\n", &save)) {
+		if (sscanf(line, "0x%" SCNx64 " : 0x%" SCNx64 " : %c", &pfn, &size, &flag) != 3)
+			continue;
+
+		page.address = pfn * getpagesize();
+		page.size = size;
+		page.status = flag == 'R' ? DRM_RAS_RETIRED_PAGE_STATUS_RETIRED :
+			      flag == 'P' ? DRM_RAS_RETIRED_PAGE_STATUS_PENDING :
+					    DRM_RAS_RETIRED_PAGE_STATUS_FAILED;
+		add_page(&page, pages);
+	}
+	free(buf);
+
+	qsort(pages->page, pages->count, sizeof(*pages->page), cmp_address);
+}
+
+static void inject_page(int fd)
+{
+	if (igt_debugfs_exists(fd, FAULT_INJECT_DIR "/probability", O_WRONLY)) {
+		igt_debugfs_write(fd, FAULT_INJECT_DIR "/probability", "100");
+		igt_debugfs_write(fd, FAULT_INJECT_DIR "/times", "1");
+	}
+
+	igt_debugfs_write(fd, TRIGGER_FILE, "0");
+}
+
+static void test_info(struct igt_drm_ras_nl_context *ctx, uint32_t node)
+{
+	uint64_t max_pages = 0;
+
+	igt_assert_eq(igt_drm_ras_nl_get_retired_pages_info(ctx, node, &max_pages), 0);
+	igt_assert_lt_u64(0, max_pages);
+}
+
+static void test_inject(int fd, struct igt_drm_ras_nl_context *ctx, uint32_t node)
+{
+	struct pages before, after, debugfs;
+	int i;
+
+	igt_require(igt_debugfs_exists(fd, TRIGGER_FILE, O_WRONLY));
+	igt_require(igt_debugfs_exists(fd, VRAM_BAD_PAGES, O_RDONLY));
+
+	netlink_pages(ctx, node, &before);
+
+	for (i = 0; i < INJECT_PAGES; i++)
+		inject_page(fd);
+
+	netlink_pages(ctx, node, &after);
+	igt_require_f(after.count != before.count, "VRAM page fault injection not active\n");
+	igt_assert_eq(after.count, before.count + INJECT_PAGES);
+
+	for (i = 1; i < after.count; i++)
+		igt_assert_lt_u64(after.page[i - 1].address, after.page[i].address);
+
+	debugfs_pages(fd, &debugfs);
+	igt_assert_eq(debugfs.count, after.count);
+	for (i = 0; i < after.count; i++) {
+		igt_assert_eq_u64(after.page[i].address, debugfs.page[i].address);
+		igt_assert_eq_u64(after.page[i].size, debugfs.page[i].size);
+		igt_assert_eq_u32(after.page[i].status, debugfs.page[i].status);
+	}
+
+	free(before.page);
+	free(after.page);
+	free(debugfs.page);
+}
+
+static void test_invalid_node(struct igt_drm_ras_nl_context *ctx, struct nodes *nodes)
+{
+	struct pages pages = {};
+	uint64_t max_pages;
+
+	igt_assert_eq(igt_drm_ras_nl_get_retired_pages_info(ctx, nodes->max_id + 1, &max_pages),
+		      -ENOENT);
+	igt_assert_eq(igt_drm_ras_nl_list_retired_pages(ctx, nodes->max_id + 1, add_page, &pages),
+		      -ENOENT);
+
+	if (nodes->other >= 0)
+		igt_assert_eq(igt_drm_ras_nl_list_retired_pages(ctx, nodes->other, add_page,
+								&pages), -ENOENT);
+
+	igt_assert_eq(pages.count, 0);
+}
+
+int igt_main()
+{
+	struct igt_drm_ras_nl_context ctx;
+	char slot[NAME_MAX];
+	struct nodes nodes = { .device = slot, .retired_pages = -1, .other = -1 };
+	int fd;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_device_get_pci_slot_name(fd, slot);
+		igt_require_f(!igt_drm_ras_nl_init(&ctx), "drm-ras netlink not available\n");
+		igt_assert_eq(igt_drm_ras_nl_list_nodes(&ctx, find_nodes, &nodes), 0);
+		igt_require_f(nodes.retired_pages >= 0, "No retired-pages node on %s\n", slot);
+	}
+
+	igt_subtest("retired-pages-info")
+		test_info(&ctx, nodes.retired_pages);
+
+	igt_subtest("retired-pages-inject")
+		test_inject(fd, &ctx, nodes.retired_pages);
+
+	igt_subtest("retired-pages-invalid-node")
+		test_invalid_node(&ctx, &nodes);
+
+	igt_fixture() {
+		igt_drm_ras_nl_cleanup(&ctx);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 806320a82..14e576ea6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -361,6 +361,7 @@ intel_xe_progs = [
 ]
 
 if have_libnl
+        intel_xe_progs += 'xe_drm_ras'
         intel_xe_progs += 'xe_err_injection'
 endif
 
-- 
2.56.0

