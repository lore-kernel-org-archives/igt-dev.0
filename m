Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE8A606A32E
	for <igt-dev@archiver.kernel.org>; Fri, 13 Nov 2026 13:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YJlPpJFK;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=alBoju8t
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8EB10F2D1;
	Fri, 13 Nov 2026 13:38:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938CE10F2D1
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2026 13:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794577034; x=1826113034;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AKCI+Ab4c2yaQgsKWwUO4nzvbyw0WTQYmsVyZSlHMn4=;
 b=YJlPpJFKkB9aFh2oFPA/fuGh7dPYVoENEBUEfeB5BlXrbyP5dMvYfMnP
 FXWzwx68BXmp/sVUFpbpG3wwlFw23YvliG70YPeDusoqLt4kDOEC2wwPT
 MfJd71Jv80KZDG+rMU69LrTkmM9Ro+F6YQ+mgxiLWQyCG/ajS3et2FRzN
 Mj4nlbg/onH2h7ICw3PASixN+Ekkjewx2t0MN/Hf0kpeQpVV4aj+D/VSr
 tfY960rqaXbnEYcxX1ZayqdY9pOxizsjXwBc6EbEs3Q0JmKMN8fmWepuh
 G0xO2uargpwhsy1mslzAz65Wekoo6ywhShdqvwg1K/AAYUMPwtpHkR+1p Q==;
X-CSE-ConnectionGUID: 08UxB6/aTgG5FKwdkdfU+Q==
X-CSE-MsgGUID: jzb9USpgRiiEIAFLdRkLGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3281207"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3281207"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:37:13 -0800
X-CSE-ConnectionGUID: 80Z6G2tgTHCuxVdr2eCaEQ==
X-CSE-MsgGUID: X9wkMKAHSDepIkYHopgB2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; d="scan'208";a="10645242"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:37:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 05:37:12 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 13 Nov 2026 05:37:12 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 05:37:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHq00shvL9/x1zere4VZbMCfQZmlV6djNAS4d6nAfAAw08kkV+ipgEew1cUlVbzqYJYFVZoPvob0XUEcmWE+e5W5CqRWySVJFKQVp18hc+9nErpGwFWEbzVabMkVXzZDgeEJhcGSph72xpYACSY5KGjkf2op0Hq6wmYKG1FQZKk/rZAbnsT4T4m17DQwOJOxaU3EEz+5T/vHG8N3tv0a0T/cOj6J5WYx/MZf7q2xvrBUdz2EY2qNTR3RNjPKdcmt+F775uV+XqHh9xqDAeSjrTZgb///QzuWupw4PguI7gEElRUQX7ly73S4eh767JSP3pyH4CZBrJ5Br/SXqaF9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2S6pZf09Gb8duumfj5XvZMMruV43pI6XC48bV1xntQ=;
 b=Cad4PSi12bpkWM/WA1ibOd5dGx8/MFvEN477yJnwGczEuTcS/rGO+e//o6AVnLQ/QVjpg7fu8tUpabYSoIt0KIzLZeTe0qBa71tUQZVhlC4kUiqsSHNRa07yiI2wgHSOwxthJKxan+hVI1pYWwic/nHK5/NNfUlcOarzGpTZ+0gPcoeYvEi7TPCtz18V7xlBlCAJGZkWRPrl8HJ80w8B+5ynHGCwaBAktu/DbQ9I4DLvnvD/7YQ63BQYrgMLgkpLNJyrPE8bswI9oSEujJEfdz+Lk0ftyPYHSEdqmnq7HFVW78rpXag9zHeh/RS9rkvbFXI0sQaJSviC79KPNjtLUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2S6pZf09Gb8duumfj5XvZMMruV43pI6XC48bV1xntQ=;
 b=alBoju8ttyrt++/BJRveGdIORjZn4qeWV6sBza1D659tqzSuZJu1E4tp9UVRbuNsvNUzmCFXel/IusFvbpkFK2KfW9he6rfqn0i/p1xiJ4LhbtaGP4Pc0wRRIcdgLfugcvhPVFWNO71n8zyH8I2L0KXxqWo2WynXJ8FLQb9vbFQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS0PR11MB7622.namprd11.prod.outlook.com (2603:10b6:8:144::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 13:36:58 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%6]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 13:36:58 +0000
Message-ID: <4e616e7e-0f93-45bb-9e20-d79c24ed8a5b@intel.com>
Date: Fri, 13 Nov 2026 19:06:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane_cursor: limit simulation to 2 pipes
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20261112041907.2876691-1-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20261112041907.2876691-1-jeevan.b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::12) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS0PR11MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: 8adea2c3-e83d-4583-fbd2-08df418b3051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|1800799024|376014|366016|23010399003|18002099003|22082099003|261009223027099003|3023799007|11063799006|56012099006|10067099003|261102123227099003|261022105027099003|261028144727099003|261021121427099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: tCVX9vYx2uQRXxpjzROlIulE3bUK223EG70k37GnxCqwwNeiNzKmL2lQ1tkumJH8Up3vlMcWRhnZiRECPlkCgAXqBD1j1oIgWXuJd1Ym+vtcw5xJ6rac2KP/8OGDYC+9rtXjvg7zQiK1N1MPek+typgl6PKur0nL7IDkmfM3FIw3Q3NFYUp9KSLSUNUjNpUojhkzLkiSezQ6oN6/bPit52TkhLpRfAx1Ibc4Aix/3f+VpSF7pAcpVDAXkH4xfD6JqRqVCvxDxbCs36tmlESEQtoqTDpm+jRhkVmEdtzUPiIoV4NwAYzuemjZ9KZZ+DSBe1X5f7T7048SIxPEsAUR8NMCbRaN1yuhXJZvPNnYVsVRSMFjVpPz2vb4/CFbTx7vilof/Lh6qKJ0/5766Z2a6oleGTk5PxhHHtx8fdpCgxlrEuzL+vNHcjOkgRZ34Hb21ib4oWDPrumeYTtFCbBHBxLHpi9V+cpAw4NFGqvvI01sVG8zMgj3YLYdPW7vMkYWn1Eg6Gq1XVtV2CPyNa2+NgXnubXbebhcatkBRgFQyFLJqplYQ3hCjvmUBBCjrMOcc55Vy1G9u7fKIQ0/YA7MGzCoPWlGygSMYBa8M1m0fIi+8LNEb3fIG1zNwY6S0qL7w8G8/782J4hjVunZsrYEp6wwNe6MPX23AcIFkM6mgy0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(10067099003)(261102123227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk9MVll0eS9MK0NXVFdXL1dPVjBaYTI2MEFhTzZ0cUtXVGVpVEhmNlJqSWVk?=
 =?utf-8?B?S2lRN1ZXVElJRUdPWUU5cGtBWmhFdnhPT1RGMWt5UVRCMkRiQTZJamlKc0ZX?=
 =?utf-8?B?U1UwWHY4SWZ4KzJJRkFqYVBONjgvME9Mb3BqbmhZNWo5cHprak9BWCtMZjdM?=
 =?utf-8?B?TFFwR042alk0REFia25FdGx6a0xuWitpZjc1eEIraUt6bkFwRnQzOWs0MGs4?=
 =?utf-8?B?N1NoajRRWmo1Q3VXYWRnVWk2cWZZaVlWOGtwL2VkWGdDdEduWkVpTEt5M0Mv?=
 =?utf-8?B?ekl3V2hTNEIwRFZ3U2ZTYVZiODBaTHlyRXRWTTRpbHZZOWkwTWVuSDl0VkVW?=
 =?utf-8?B?OHpIbmNRdXhZWTh3ZUpMcVYzVnh1aURVT1hTTmprb3hRSGpHd0NDdnNtVHI0?=
 =?utf-8?B?dW5BMHR2b3lFZjg3WHpCWS9Pa0xaeWxqdXVNV2xZeExKUURsSklnOFlBWGQr?=
 =?utf-8?B?ektVbExZWjV0RjlRYUR2SHBBUzJ3UG9IRStzN25yZlM3OUcvdDdzT2RDQ3M5?=
 =?utf-8?B?ZHJKc21LT3lTb2NYRlFQYWtlcFpyQVluZDZVNTJlR3JHMGRHdkx5ZGx5T0I1?=
 =?utf-8?B?allUdFZQL24yZlJoNlVjUkNzS09YQWs2bHFUcHMrK2hyd1JHZWUxOGRGZy9a?=
 =?utf-8?B?WDNkWk1jVUNKbEVLUkFwRlRHMSt4WVZpR2R0akRpaHNwNUpHaHpkVXJ1THZl?=
 =?utf-8?B?Z1pvcmlPSkpDUUtRYWxqcHFmdSt0TGs5a2pjZERjS2h4SENrUFJ6MXRoelM0?=
 =?utf-8?B?NTg1VjU5VUtjMzdrSUJMWW9sTlp3U2JXNWhQSTJoTDJoUFdkUDNZUUNTM2xh?=
 =?utf-8?B?V1o2UWV6OW5GZm03QTE3amhudXkvMkN6OUZENzc0UVpENVd6VVVZdjNsLzlk?=
 =?utf-8?B?R2xnZjI5S3psR3cwUzRyYStVb1BtYzY0R3oyZUhUWVg4eEV3Z3VjdDlEdzFk?=
 =?utf-8?B?Ulh4K2RUNFRWSVV1R25HdmF3ZU5NbXY2Uk14UjM5Y2tVQjd3R3VseERzQ3Zx?=
 =?utf-8?B?Zy96aXJNSFp4eC81SEVoSms5UGNibnFSVEpvNFVUck53TUJBY2dMd3ZFV1lv?=
 =?utf-8?B?cXRKSG5JNEhodUFjNlRvNHFZUVRqSld3RGRGd2daS3BFbUM5NVBhNmRQZGt3?=
 =?utf-8?B?K3BVUXd1Rk4wVmJuTmlSd2JyY0lOT3BxZStYeVRLRHBONXZLcU5HWWdFZjZL?=
 =?utf-8?B?NjFyb3g0Q1dmUjVOdnh6VUtoOStob1AwMXNqQUdSNDZjU29vWklGY3RMSWJ3?=
 =?utf-8?B?ME5MY0htYVlNVVp6b2I4UlV6ZmVodkdPWm5wQzdBZit1eWlUWEZEMmJmc05v?=
 =?utf-8?B?UmcrVXRaZXd5dG93eW1yLzJpbzQ2M25tZGV4czBTWk9XUlNkZFhEQ2hGN1h5?=
 =?utf-8?B?eXFhN2ZIckd5Vk9iclM3dHdNMUhmQjdjOHcvK0Y1NGhSRjlIMWJjMFZMSGh1?=
 =?utf-8?B?UVJydnZnbXFvTHhVaERiUlF2YWovcmhTNTByWkZJNm01bGR2T3VBYkZHN3ha?=
 =?utf-8?B?Z0tLQzNoNjJ0dWcvVGdHV3VuWEdNWXhvOURVb1pGZ0hGOWZxdHhaZ1NEMStE?=
 =?utf-8?B?K3VUUzNMQ1pDVlRyNFhnbEp3N1lPSlE2MXpqd1c4VHE2ak0vM1Z6NkhrcXV0?=
 =?utf-8?B?WGhUVmlLdjRjVFFlVmFVNnh2SFk5QnFtVTZOWHcranpSZzh0R2p1UmgzYVNw?=
 =?utf-8?B?bEVVU2o0czU4NCtzTGZwcktVR0FSN3Bkc0NWRDJ2ZjFHZEU1RDd3MlNFRlFE?=
 =?utf-8?B?amFOVUNEekpscGdER3VoSlovYzlMd0tQWXdybTRrbGREaE53VndWMjhEU3ox?=
 =?utf-8?B?NHd1MUlwUmdzbXg5S1I3UFBxSjc3dHFCc3BOZ25qdjNLOGZzSElMSzF6YndZ?=
 =?utf-8?B?dWJ0VTBHeWN2ejg3TDJ1NEQ2QkorQVJFbGY5MWJldEZSRzFzUlpnRWdxeGVK?=
 =?utf-8?B?VkpGVE5RV25QYXpGV1VEcU1OdGZVRXhzNHg1RkFsNUlJdFhXTm96YzhESDBC?=
 =?utf-8?B?VjFnRWp6VlQzdVpmVldUMXMwQ1QrTUwxQ2l0U1h3MHBWdWJvVFBKUmdPTVJh?=
 =?utf-8?B?YW14WUlOS0FWeGx2NEdta2V1aHFpbDRxRnB0VDE0bG9URzJqMm1QemJpQVVI?=
 =?utf-8?B?ak1uUDZVM29ieXYxdUhyRVVxb1NWWUczaUJrS0cyK2lEbzNORkgwNmZONVMr?=
 =?utf-8?B?VUU3TUlTS2RobFJNMy9FV3hFR2syblJHbkNVS0lQL0VMb2JISnk4RUllNGg4?=
 =?utf-8?B?M3UwTjV1RlBTWjVsU0VaUDlUdDVsSnN2UmtTRVlEeDJtbGxEdHFCY1J0SDhy?=
 =?utf-8?B?QS9kQnBpZldoZzR5bXlpamV0ZEdKYzFkaVNlWWV5c0Zhd0VqMU9JZz09?=
X-Exchange-RoutingPolicyChecked: jBJ7FWLj2gP30M5seUEWnS0YuKT6w03iNt2R5UeNmjsX+fF0gjZa7eIbocN1c9rEkXtwv9DqKFWMrlktSZkHVriWpu7mM3Pxibp6dHO8ax97Ji2fe9EU0oho/t7Rcq6/j1evT6o93wE433gzFGsWvEroU/koLd0nWrUBjKwKu6LLcEkLbEhOcG2bgSQxOBh6klrUGRTDEBzjr1MKjRPhSXkzEjuAxsm5RMt4NbkZarf7Y7uPg22RY/X8bnFEygvJX+/CfvIz9ud2rvz6mTOik8ikFbk9KU0jx/bnLNjmgF6Pu89PZBcNQk1S0Bmv0Ukr2CVBX5yO3rYhBy5nw8EoMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8adea2c3-e83d-4583-fbd2-08df418b3051
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 13:36:58.1024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TzGHst3Am38NZT2cve4soveuJbdWjH3WKutdFv6rAUEl5qQC+91oFxdYhi0Jnr84z4JmfTu72+fra4U0JnxMaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7622
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jeevan,

On 12-11-2026 09:49, Jeevan B wrote:
> Running on every pipe makes the test hit the timeout on simulation.
> Restrict it to 2 pipes when running in simulation.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_plane_cursor.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 4b69f1a17..5938b50c1 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -68,6 +68,9 @@ typedef struct {
>   	int h;
>   } rect_t;
>   
> +/* Max pipes to test on simulation, to avoid timeouts */
> +#define SIM_MAX_PIPES 2
> +
>   /* Common test data. */
>   typedef struct data {
>   	igt_display_t display;
> @@ -327,8 +330,14 @@ int igt_main()
>   	for (i = 0; i < ARRAY_SIZE(tests); i++) {
>   		igt_describe_f("%s", tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", tests[i].name) {
> +			int pipes_tested = 0;
> +
>   			for_each_crtc_with_single_output(&data.display, crtc,
>   							 output) {
> +				if (igt_run_in_simulation() &&
> +				    pipes_tested >= SIM_MAX_PIPES)
> +					break;
Running on first pipe and last pipe is better than running on the first 
2 pipe from coverage pov, IMHO.
> +
>   				if ((tests[i].flags & TEST_OVERLAY) &&
>   				    !igt_crtc_get_plane_type(crtc,
>   							     DRM_PLANE_TYPE_OVERLAY))
> @@ -361,6 +370,7 @@ int igt_main()
>   				}
>   
>   				test_fini(&data);
> +				pipes_tested++;

  Nit: consider moving the limit check next to the increment at the end 
of the loop,

  if (igt_run_in_simulation() && ++pipes_tested >= SIM_MAX_PIPES)
      break;
Regards,
Karthik.B.S
>   			}
>   		}
>   	}
