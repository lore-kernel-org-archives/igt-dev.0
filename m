Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5029E606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 18:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bk4pZ70t
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02621112CE4;
	Fri, 27 Nov 2026 18:19:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06BB10E72D
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 18:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795803126; x=1827339126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5f9n6OOdRVyZGZ97l3C6XJDsvyqW1jmgSdEOClJKdrU=;
 b=Bk4pZ70t+nF9PcaUABEc/0gVa+r6/Hy6AQn15I3xIlYFAwW1ZuWvRBm9
 1QGEIgxViyD2TI9nEDjoNK117xjrPJ8gG1ZyVsHoieZnCg4WEZzfierZZ
 6+PnfKGV2pfPbWD70jPrVywuIqABkW1juZdw2P4NPoV/3TxPcDeVzgRth
 XcXFVSHZogWOAXLjRzIX+yAe/czdpl7pJZs4spzY4Iff9VA/ix3NrOv6f
 1NnaZTqwRyNJVZNw3x7tst8PigA7lcHJuH9YhZNrFm93yyLX50n/oYWJ8
 f/SJnrNn5QpBTfytOHO/5Ri0LPGtNrm3H+06gdrrhx+WtleS+n1QTTdYB g==;
X-CSE-ConnectionGUID: nlliPnIrSsGF48VM3zmdHQ==
X-CSE-MsgGUID: oKfMK5lQQIqvHkPvHpJubw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4602890"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4602890"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:12:03 -0800
X-CSE-ConnectionGUID: Lbf8lK4vRgK1zk9XyXTlhw==
X-CSE-MsgGUID: sbjvXmWeQuO3oCdfi1ybqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="14208082"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:12:04 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:12:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 10:12:02 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:12:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfM3lo1EmDlXuWBabmm2O2WS/HzQIYmX1AApJTyv07Z7egwq6NwFJ+bwhlkuv7YvIKY3SMKv6YkcEHnDWn2XT7YAhDjYy9UdTFGUdwqthFikSfRbrMi+ACefHBhGc5I1VD5r4Ys482rhBrzAYmoTaX9CK5YwXcKeOIpqHhbJiDM6gfle08CwRRA+FxkYEft+CwGgdX6cqnmzwuUIAme0qTCAYwoyyfe7FmYAJisZPsywgQQ1OoLv5vUGQ/aAGBM/JiLmd5lqH0KUrVXFsy4Rd7QF5azl2QDsT1cGiAtfYSPt2YZhAEjxsifBlP8Ly1Q0JYFcQ884wrxzXuLf35Ek5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzNlBXVIwWCZ3BhJ/4ZcSkWtfPxPzKsbS6vfYmH6wJk=;
 b=BiRTBAosU1CsySIvN/mm9ClTa8GRAXn8acGGHArqYpMONsdbdQlMJLrT0lSjEjEomZFdycJkDgK5GKypXUNL/8RqyqOaQX+CT3bULdS/Ywv8z7yMlXkPIztLEregZjYec3fjSduZZz6EpaXPsLu4k2+xYjCp+nEvKTStYTpoOiukRPHqF7Gthg/ZDePZMlih+Y4m+p6OItWi5MSkSpZhx4akAtWQ+7C6v865d8YAYYW77El245BK872pvOhPPQis5u2In+q3cp6fY0PDq0PHijjS9HYa7UW5XTpjyPTFEEC/6ngjiQZb8m5T6VUJMdufF/qoJ0PdvUDYg8r6CLJLQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.9; Fri, 27 Nov 2026 18:12:01 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Fri, 27 Nov 2026
 18:12:01 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 9/9] tests/intel/xe_drm_ras: Test retired pages
Date: Fri, 27 Nov 2026 13:11:41 -0500
Message-ID: <20261127181133.801215-18-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127181133.801215-10-rodrigo.vivi@intel.com>
References: <20261127181133.801215-10-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0013.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::14) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: e69dfec3-4ad0-40df-c4b0-08df4cb1eeb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|5023799004|6133799003|261009223027099003|18002099003|22082099003|56012099006|10067099003|261022105027099003|261028144727099003|261026140227099003|261102123227099003|261026121527099003|261021121427099003|261022075727099003|261022113327099003;
X-Microsoft-Antispam-Message-Info: 8TN8waa/KoglcXBPdm/+RefQkGdLy3wXtIsV+Ca+r5uMzq1jn+NphAbWvIWF3Yzg+m9FRDwROZIsiCPV9liA0Yw1Pu4gRMuoJvCYyNVrsvq2su5dLzxCxxBvJ0IHtsyQyKZYek72Q3xZ8gIVGkdeu6pR1yIExsOSZSk1rv6GQ9mWFT9HpnTYpt16t0QM2PtIptYb7nCXGnYLAoUh+XwwEFIrnvFjIWc77qKA20dfbIPpmrWXZ525djaGTeOYz0alhnd7dRD5BOL+obh+Ong6fo9cT8CY2HOQrst6lMSWTsH34ZbQR0WSGFrqH9vfZ9ajH7NEn3frIBLW+8vIO3QFhOWz7A0QkGN+f9ZZjRbs5Ngm9H/E5lBfE0K9aN7DN4u0MnbWgag8IU0Eq0wevyDzrNiTMftYIyYeCwjvY14B9KqcftZdVdco5EKCFS3v7IeX4a1oLIbQ/RaH1QwtXP5wI8kVDWnFdxHCoQpexU3w0SY+Yh4uUJwROsRDt04xNbbMwKZFP+MOytrUw7ThYDP829/rgFEXmMf8tm4TEngkYM6SIJjIL8zmj5NW2ZiU6kMBluLMoASy70brxBvzuQvioZwwxfIE5e4TLkxeTzOUqcJ6xOXSQZi03G2jLMp96K93gOSFtY2PRD1pdW6XkFohiTpHLdhVqqNVN3zUDhGeVNo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(5023799004)(6133799003)(261009223027099003)(18002099003)(22082099003)(56012099006)(10067099003)(261022105027099003)(261028144727099003)(261026140227099003)(261102123227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022113327099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmQ2SThKNHVzbkw4VUxOakNKa0xnbjlPMmdZOEc2bnpGdFlEOFZmbDU2VXdj?=
 =?utf-8?B?YytvQ2t0SkQ2MGRzWFphaUFpbnJmUHZtb0Mxd041Q0hEQy9TZDZyc0x0TkhR?=
 =?utf-8?B?cG9GTkhHNVpJL25GZHkybmJTdlR0WXpYdkc1QkxieEJRWXRjbng3TWdESUI0?=
 =?utf-8?B?ZG1ydUE1cVVjcHc2QS82eEZES3B4eVp6S2JIakxZNzliTXBHMmlHV1JFb1Iy?=
 =?utf-8?B?OVpnU2hBR2lFZWxkWGt4S3RtYjIvY0pIN1hFZkhFbkJkZUo0K2loQnhhaHZS?=
 =?utf-8?B?VzZoTyt6VE9OcGVpQmZSeXlHcG9VOS9KZlVZMW5JaTE0aUhobjlKZGtjK2do?=
 =?utf-8?B?cEszOHl1bExWdUtNa2NaMkJQU1BsZC9taFhwTTFCQ255U3FNdFRrUlF4YmZj?=
 =?utf-8?B?YUN2Qm5GZi9XellpY1Via3E2Zmw2R0VSdVBMck1LaUwrc3NuMkpiclNmSzlQ?=
 =?utf-8?B?L2lETXdNeElkTWtkWkM5UnpjYXdRQXQ1dGtROS8vTmxmQ1loYU5MbnZlSTNt?=
 =?utf-8?B?M1pWL2UxVDByY0NwcVFyTDErOXR6bDJrTjJGVWhhMUtmUzJ6VzVxdmxnV3V6?=
 =?utf-8?B?TUZLTkRtcGUzdzlKeGtPRW5QZGdBeWFRUzdkS1MwdTBwYlVJR2I4blZrOEIr?=
 =?utf-8?B?cUFjUm05TVRUVlQzM0tHT0lnbkVhR0hkVzV2UUVwdFREWG1Yb05rMXVjYnlD?=
 =?utf-8?B?UVIrb2J4QWdsRjBqdTMrV1B1aThITnU2T1BVUEFMSmp2enl0SlBzS1FPYWw2?=
 =?utf-8?B?OHVMVkRLVnE1L0RvRFU4OVlHemlQVU04MzhWUWhSQmw5VVI4T2xtNC9YY2V3?=
 =?utf-8?B?ODNIM2w1a3lreEZHd2E0ZmRCNXl1YVdGU1B3QVZDSHQ1WWMzUlB4RjNCcWhv?=
 =?utf-8?B?M1NYTHFHT1psWGlUV1NMbGtWZkMrMlE1NUQ0NVc5d0ExMkVRa0VENDR1NzJF?=
 =?utf-8?B?R3dGOVZzN0J5VlkxMXNjYUE1VjkxaVU4dStPN0E0MXZ5Z3pkS2phMkVrV2s1?=
 =?utf-8?B?dFUySFViTHRjNmdNUTNZeEFwYkhtQllMMm9ONllkMFppUE9FVlB1Zk1GUHlS?=
 =?utf-8?B?TW5CTzdHL2ZUcEMrTVRMVHduc3F5MER6aVFXMFc1L0VhM21vRWROY0N6N0pn?=
 =?utf-8?B?VEx3N0pqOEJhOFpBMEVpaWdVZEl1MFBXV2JSWUhpbUFKYWU3TDVLNTF3SkFz?=
 =?utf-8?B?blJNMmVCdTlOS0h2T29GSzN0MnFPRHlDV2JQbTZJc05sWGJIbUlSTHpZYW1U?=
 =?utf-8?B?K0R4eE5CS0d3UG11MGJrTElBSkVjWWZQWTFpUGUwemh2ODdGcTUxaFJpcENJ?=
 =?utf-8?B?UWVKT3FZM2VLSW4waWRkYkVZdmlvUlo0cHk1WnJBUTlXdTdsaHFqYVNscEpn?=
 =?utf-8?B?dzh6QWoxWXI2a21DbzZhRVlidjIyekFxM2xmeVI1V2psa1YxRGRLVzk3UWZl?=
 =?utf-8?B?NU81b2JMQnBhT1JIaGp0czltbnphbUNlVGJLcmVXc1Rka2Y0akFrTkJJMmZE?=
 =?utf-8?B?MzNzdy9Oa2dNb0h2ckswdHZXMGVBYnlraTZBYmIzV2hvZVpaeWNVMlNGbGRx?=
 =?utf-8?B?RmQ3QWJSN1NZeVRTeFJkSHpzQnp1TzlCaFEzdFl4VUFib2N5ZEU0YzFaaU1v?=
 =?utf-8?B?UXEydHc3aTY5TEUvOUJsRjN1enRtdm1qT2lNWjRwWlRFWHBLRVNQczdyUDlY?=
 =?utf-8?B?RWs3QVJUd0ZNQi9OQlgvU1BMQXFZV1gzb3dUMFZBb1dtT2JzQ3Q4QUJvckJD?=
 =?utf-8?B?WnRTY0xvSWw1SjhRMDZBc3JBNUtkMXhITU1XRDU0eFE0bGUydEhOcnVHZmd0?=
 =?utf-8?B?c3BDUmFrMG40V1psdlU5SEhsc29RNTJlbGFoTjVJSmhMaERYSUcvdS9MQ1lJ?=
 =?utf-8?B?bkZ4Q00rTmF2NmZyWElIN1JkRVNaeWI5bkdmTVQ3RVYrREVBb09Ud0p2Zkdu?=
 =?utf-8?B?ODhZSDVRU0JCNkdzeGVqSjlXTlNVV3Jtb3NZSGpjVXFlYW9jT0Znek1XTDN5?=
 =?utf-8?B?OUhjc3lrZkQzbjVtNFh4cko0UnN1ZUJXOVBnb1dPc0ZUTmlHejNYYjlIMkxB?=
 =?utf-8?B?dXFJVytGejgybXFzSHNNcjZaaWVFL0tFc0FOMG1aSVFOOUV4WDk3SHQ4dzZY?=
 =?utf-8?B?cXFuYUMrZFdyMDZhWTlDakluL1kwbVFCMUtFbmx0bVpFb0pEcVl5dHpqaVJw?=
 =?utf-8?B?TzBFQ3ZXamQrbDJuQTRjZHlMREJuL0RXZ0JMUTlCc2xXUWRWRGpwcGJsaU5V?=
 =?utf-8?B?NGtLM2JHRmhoRFl3RklhT0MyLzZ3ZHFmc2ViNFlMS1RKSlI0U3RDWHFUTmF6?=
 =?utf-8?B?WHkwUDRoUzVSWWJnU1Y5OFZNSit1N2xTeEVoek9NZ2NVWVpxelpvQT09?=
X-Exchange-RoutingPolicyChecked: gKURfjpVAg+t6w2nlW5MzM6cWQAtJIuosJow9H3ZcwvTEE3Gm44uZOJaGYDH8oWwpiEt7x5/4snaue7T5d5cQS65v0tn3D+T+hx9u9/S419yAommfNLKbptrReQqgzDT2G4wUmEF9efv0VKxC1uDQ01Kn4ymZiSPaKJKeH5t/lWAGloYI4S/wFMSiXM5We/zAdVX4+v1nkvbauJDTsaxXyGPUBNpyd4KY6di1srGTlx+Qtr5VfPjE1+mZ9lEMLzQswXFpvbkDqRLWFrVGxGf73Leu4NMqfqTyBKkWlyRKv3w1SoHdvsDewNbKemvGswYVm+qjgC2mLOOidL0NJ1VnA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e69dfec3-4ad0-40df-c4b0-08df4cb1eeb8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 18:12:01.0103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gh3QwK/CHKM52lFK1T1Hpb79Sg8xVsBH4HQY5pCXyLpmBbCQU5fgYGn5+QFdApVmNcbOVoOnXFBWELeUX6KfKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
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

v4:
 - Sort the pages before comparing, drm-ras does not sort them anymore.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_drm_ras.c | 217 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 218 insertions(+)
 create mode 100644 tests/intel/xe_drm_ras.c

diff --git a/tests/intel/xe_drm_ras.c b/tests/intel/xe_drm_ras.c
new file mode 100644
index 000000000..3be002040
--- /dev/null
+++ b/tests/intel/xe_drm_ras.c
@@ -0,0 +1,217 @@
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
+	qsort(after.page, after.count, sizeof(*after.page), cmp_address);
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

