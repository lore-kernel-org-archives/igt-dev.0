Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325B9CD342F
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 08:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25D610E9BB;
	Tue,  5 May 2026 08:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8El93Q4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC5E10E9BB
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 08:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777968158; x=1809504158;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=37m/tarQmMKgu+Fl0DM5/WWsUo5BX0YAWiqC6TsVkI4=;
 b=B8El93Q4K3aa+VRYsKfkOZMudg+WZFH3YlTizuKZGwFw6azPprSRdGM3
 BQkEzHPj3Xog5byJ8OEjQi2gcfIoxQ04byLkGz6H8aC3tt2cQmfg4KcQB
 62P1RGEF9zv+3pmcJXhJ5aj/QfhAzVxKjc9FinnDPu82bvAYr3hZuEGye
 hV6JBzOKUBOyJ/kTBlZ2ntXUEHOn3Mgf3/PGnxK20mR7aOFH+hX7+LaVL
 jpT9FAqF3mCXP+4N9AKtasATU12Q92oU9C/qDVe7QJ4E5kwcQ12SBPtID
 +6dpmDROekvwilFL86JPDRMcIz46uUdYKJHvnQJtRSIDZ02uS97amZy2O A==;
X-CSE-ConnectionGUID: NF/rvhGFTm237uxp9pzwrQ==
X-CSE-MsgGUID: IN7zRYoWSLSU9LRrlmAtPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="101499209"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="101499209"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 01:02:38 -0700
X-CSE-ConnectionGUID: OLVSQhS8SXSRtR3FhfDpNg==
X-CSE-MsgGUID: xsSl5GBdQcGrmYUbbdWR8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="266089815"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 01:02:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 01:02:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 01:02:36 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 01:02:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=moujcXUZ/qOjwZFR1S1gGCHYmc5XYIgRffiBGeY6yQ3cCqf+PCJ56EcrklQHT0XgvgJcq5rJhGwOtdg24QPjd/MjOH63fLPYRhfzPANSZzR5QGAjixQc0q6YvBjjlHVcSggZRabi44Fno1mFNka94aHoAxAAJN3QmNvtnhH62DmH2A++fDmb3nk22O0+Q3DVU3I9GGmvJhkZbq9K812JP9g66v05i3SK/lWNTN6hNlmrtfx1mwFpHuUj44KXlS1VoULJ/vhRBqt/fR08FWakec2f9MiSTIXlRbBxw4Y97uPJQAmrbwSm3Mj7Kx7v/yx/VgWbxN6s77HGCqd84xpqmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yX/+34paCNgOAasB0DvAcNDlG25HwHc4lDqWCXi2SXY=;
 b=jb/yqbC/yBxP/G7ZQxjcYR01fYRPfLHsBYrDvpZizDDMw6RkyFMVphaUWPtpKCf8YuwkevYPKNH9fJJ6vVuB4neJMjGbrt9fIB8r4QAdZL1HCpQXzCS3ufHsC7rikshM9X99RPLwhAuSi0CEs88Pz+pIGdREVNfuRti7M0Jj9leiuHw5sWG9sCR52XoL2tWL0TH1dXZeH8QjSnZN1D7rAOMtFIRhTzmFpBkgrFPqTksr4vdAOjEknrcTsFoHBPWjXQmMhMWCuRJ6CUSXDmFpC200kQdE/IFuSgwX8tE8ij+gqgmNxfeaRVqGYtC8JuStepVK9EWkqzlsRkCd0tjJ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 08:02:33 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%3]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 08:02:33 +0000
Message-ID: <1126b251-f333-4305-b365-26a2e5febf6d@intel.com>
Date: Tue, 5 May 2026 13:32:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Add a testlist for D3cold tests
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <rodrigo.vivi@intel.com>, <ramadevi.gandi@intel.com>,
 <ewelina.musial@intel.com>, <grzegorz.zuchowiecki@intel.com>,
 <himanshu.girotra@intel.com>, <mateusz.grabski@intel.com>,
 <pawel.drab@intel.com>, <raag.jadav@intel.com>
References: <20260422152254.858478-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260422152254.858478-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0185.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::6) To DS3PR11MB9796.namprd11.prod.outlook.com
 (2603:10b6:8:363::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|LV8PR11MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: b2685946-1b6d-4ac3-6d90-08deaa7ca910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: SCCAlUWLEOkeuD3UZZgBrw7y2aKYFP3zFe+gVDg9E28tmIbT83kvI/BlS9Ix3pQteKiGiVeSpX4N02YQBGef42gLig5HFqJDsZvivYwYtDDmVdtxuMrhK1bpIgmq9e+MLGZcBMnr4ORR1+GdfGUCIYSQ3ru7tLkQ6vWv0ckBTOPOhevmcKeFaXQaGLf8JbIz69GPChLV+ghbJl/opoKDq/RX27XHKSkt8Hh1Gezi2mjJMXI5fM5CWsdysI5aOG4MPUMn4eBAjE+EonOmlzl3djx1qWRntLNf8SzcQAWxVJcnDOUhMWFx1+/X0BvV6BwwKDlqMnpl2d7Of7YLNsxPCOG0zR8AiphTUXZUEvF6aHqXoiw54rhtWDNQbFbix53PWLyC3BNsE+Wm6ryG6km8vzCSzSUF4qfil0ZvF4p2XBTGOyUIAxvX4cZNWJ/i31qc1v7ZMz2amtQz7NL6b/gnYJGg3ENkQZi67496zCOmBdI+5U6rfwrJSVSo6+xeZxhGh+PMLST6KzHQGQzgwcfokpnC9iNOUPsa8pVHYEQVpKXjqy8h9q6IOjiUcC55Gd6X5H4LPU4zxtT/6J66w/k5r5M+d9uMQ3KuK28eNWN8yIYWD2qlXf3m06u/lcZvlMBC7apUqvxdXuCzj/3VbDFvUr0tu9YJ6JBDcu16eMsKajBLh8UiFCrD0VsbMZJbDPen
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3cvK2dqZzhzaVdRSkNPNGNCTWZrMWFiellldk9CeUJyK3B1Sjh0QUNWc1N6?=
 =?utf-8?B?QlJwaTFSOTRjSHBzSzdwZ2xOWHZGbU9mRnlVKytXUmNBR0N0ZzEzT3RTbkdk?=
 =?utf-8?B?ZHlaRFFWZVZxa2gzMlI4OXptMkxSSHl5cXZzQ2hRWXJnREpUS2JsTjgvNHhX?=
 =?utf-8?B?b1JRc2E3cEJPMGlFRXNtajVpMHNuKy9ORjhlaDBxTVFtV2dUdzNNOHd0Z2w2?=
 =?utf-8?B?eWdUT1dwZlgrZGxPZkxUTmV4OE1iZnhrUkc5ZmN4NVpGQlBSUUltMWNVQXpn?=
 =?utf-8?B?RzQ3ODdXUTVVT0tLUG0zUkxDTWRIbGtOb3ZTQTJnZ0FpRDVrZEN2YkhpV1dn?=
 =?utf-8?B?RFZhQmoweWs5QnJFdnhYNUJyWjBZcFhoTm1PamtOOG1HaXdMd2hqOTFidWFl?=
 =?utf-8?B?cDZHbUpBU2pjamNtZkZTMk93b3NwUWlCZjI1OXFEREZtMzFlVHJuM2k2bUgr?=
 =?utf-8?B?c0RiaEF2dVZPd3dSTDVuL3lRTk5KdDRvOUw1QWluRVY4SkRsMGw4ZlRhRElo?=
 =?utf-8?B?dWNDdExJQVNwUkpwMFhLa1NuOERJWnNTNEp4QWcybXp1RHJCMUlWK2JoSkNJ?=
 =?utf-8?B?VFdiUWtSMGdEekVpZTN2VmxkTGtqaHh1N2NkTTMwb0JyckF6UkR2cHdpRXkz?=
 =?utf-8?B?cHB5R2ZWdCtuYk9YZy8xSzNHNHhYQ04vdVJoR2JBUDJTVW84YWlPc1hTdmdo?=
 =?utf-8?B?Y0UzV2RHOVgzL0FsYUl5WXZCYlRHNkltQ3ZUK0JISkVyYVBDOUsyU0YzaWY2?=
 =?utf-8?B?ZkNpcE56TFloOFQwMnFVbllqQXVEODUwWEFjSStGSDk1SVRFL2gzTDBMQW5a?=
 =?utf-8?B?a0dZbWdOVFNhZmtvdG1pZDlHSGNRYXNvdEtUdFJUL0xJVEZPeUQyNFhwNW1q?=
 =?utf-8?B?ZEk0QTU3SFcxZUNHTUtuTkRUbWc1MC9SOXowZnh5a3RtZm1kVDRIcnZ1cGRy?=
 =?utf-8?B?ZFJVbHhJOWlBOXdueW5WQnlYMW9xS0R0MGV1dFlaM1NnMEI1ZnJQdC9JeCth?=
 =?utf-8?B?UDE5ai9zV2lUU3lFVWowZitLVnpyL2FWNVBTcW9QWktMUWJ1NDNyTlFmUW5v?=
 =?utf-8?B?NnNkRFNyZEhTUERUbndRM09RTVBSajJKdlBFekU2Zm5LNWlhdnV2a0treUZl?=
 =?utf-8?B?UDVCRVdoQ2NzemFqL28zK1plRS9pYUVrZ3R2R01GUUdNY1lXd0xYTFFUMWZQ?=
 =?utf-8?B?VnJ3Z1NaSkF5bytySzdoVXVyenBUbnVNS1dDWjM1cE81bURNeW5yVG4vRnhx?=
 =?utf-8?B?VWgxZXJGenhTYVhkOXM0ZW80aWJYMmc1dkJaTG9TVWpSTXJUVTFTa0tTVEg0?=
 =?utf-8?B?SklNZVllZUNWbURxT3c1dGpnV3FlT1dja0l1bXQ3M1V3T0prSG81REFlbzAv?=
 =?utf-8?B?WldYTGdYU2laWm5ZT1ZEbzJSdDFVeFBPVG9BaEs2cE5qSWpyaDMrNGZac3RL?=
 =?utf-8?B?N0hNRk1peGlGbWdCTHJ3MkdRWW9nM2Z0UHd5VjA4MTBobzdKSGI0RGwwUG55?=
 =?utf-8?B?eWNRUFhOTGhFdWdqZ0J2Yy9nUWVBUjRGWmlScW5DSHJWTEFyYmhGbGNkeS92?=
 =?utf-8?B?eUtnQXVtNHg4Y2lwTUc5d1dXd3FWMXpqdDN5RVZMeFc2cmc5NG93aUUxMGJj?=
 =?utf-8?B?a1lGTFVFZnVnQ01Dd3dZZHg0NEVwbjVkcEhPQzdNQWhDQ0RvblA3UzZBaE1x?=
 =?utf-8?B?T1pOOUkrNWY4YmpDUkxPR0V6RjVQZzRUTyszeWt0Nk43aFVrZTkxRUdkUnVV?=
 =?utf-8?B?TFZxUGViQUtoeEZLK2pZZktuc0xsSVFBc0FFdGRTTkhqU252ZjdkYU4wWXVn?=
 =?utf-8?B?MUU0cnZNTkFrV214MnlqZW1tWmsvNCtGeG1Gb0VvWEdiWXMxbTVyWG1wMHJr?=
 =?utf-8?B?STdlTWQzcG02bWQ2bjdHYjRhMWFpd0JlWk9VSnRudjlKd2lEWU9iQXcwK0dy?=
 =?utf-8?B?dWpUWm0zcjNxdmhLNmdwQkFtVzlwWm5KNWF1S044cGRpT3JxeWVWRmZLT1J4?=
 =?utf-8?B?Qm9QeXhnWEFhYlp1bkJIMTkyMVhTN0QxQU1LenZ6YXMxS1Z0QnhsRUNEUjZi?=
 =?utf-8?B?aEMzZC9NRzBNdmxqK1ZYaHBCOWhKdWlwQVdQbGtUOVM3eFdEVldtb0R2NTdt?=
 =?utf-8?B?bTZTaHVUOEJ2UUFmazZKZjhKVC9MdUw2SzlLNWhqUU1aTlJGVmoxMDFMa25T?=
 =?utf-8?B?RDhlR2lKU3c1N292K3FkZjZTU3BqUm96bVdLMFNUanJWSllETkYrbFFSb1pu?=
 =?utf-8?B?RkxVRzZNTzdhaW4xTFVaQ24rcndFRmxxODZmRmI1c3ovY2JJV3AxTEFUd0Yr?=
 =?utf-8?B?UGYxb09sN0d3em9EaEd5SXdmQ3dGNUp5Nkt0Q3BpazBlc2N0YmNNZz09?=
X-Exchange-RoutingPolicyChecked: XTFyhFHU5oNTNmlAczTe81XGOLBssLX8J1BkJNinY9blOuRqBiWexN7Sr4Ut3NLtPdW/nWgFpAGURa6gzWy9cFRo3MgYTly4prBAm+ljzU4JLqszGZQspxPRxKoQ6mNv7U28N8+kfHfWpfj5U/GpRscxMukefw5/JWCY+pkxGegwl+vzStbfgntTENb8z9b7ZlR8djduQcfzXWVc3dEEwPX3uFs8ozSRJa1E0vfGE+2m6/4nu/SwvldH7cCs2T4+bzM84wgj/NqLhIRy2QjIFfBt2pqq4EQqkeHFUb93pZ0ZCjVXPWhI5o2ZFGZUbrn3Qok85mTxP16NFhd9qh3ANQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b2685946-1b6d-4ac3-6d90-08deaa7ca910
X-MS-Exchange-CrossTenant-AuthSource: DS3PR11MB9796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 08:02:32.9247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsdbvSDbpsFNlekIAT0ybHIQ+joj6QD3wuQMSCSBCKrclrhuhLOvO/MbhRIueOMDlzD9yrQ/DySE6o6OKdyeyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8607
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


On 22-04-2026 20:52, Karthik Poosa wrote:
> Introduce a dedicated testlist for D3cold‑related tests.
> This list is intended for use on CI platforms that support D3cold.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   tests/intel-ci/xe.pm.d3cold.testlist | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>   create mode 100644 tests/intel-ci/xe.pm.d3cold.testlist
>
> diff --git a/tests/intel-ci/xe.pm.d3cold.testlist b/tests/intel-ci/xe.pm.d3cold.testlist
> new file mode 100644
> index 000000000..783859fc7
> --- /dev/null
> +++ b/tests/intel-ci/xe.pm.d3cold.testlist
> @@ -0,0 +1,11 @@
> +igt@xe_pm@s2idle-d3cold-basic-exec
> +igt@xe_pm@s3-d3cold-basic-exec
> +igt@xe_pm@s4-d3cold-basic-exec
> +igt@xe_pm@d3cold-basic
> +igt@xe_pm@d3cold-basic-exec
> +igt@xe_pm@d3cold-i2c
> +igt@xe_pm@d3cold-multiple-execs
> +igt@xe_pm@d3cold-mmap-system
> +igt@xe_pm@d3cold-mmap-vram
> +igt@xe_pm@d3cold-mocs
> +igt@xe_pm@vram-d3cold-threshold

Acked-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks,
Badal

