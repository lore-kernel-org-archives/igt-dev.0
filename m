Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F5FC4345F
	for <igt-dev@archiver.kernel.org>; Sun, 14 Apr 2024 05:57:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7303E10E466;
	Sun, 14 Apr 2024 05:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ye4vJucT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B5410E350
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Apr 2024 05:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713074261; x=1744610261;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=CsSjia0+W/xLfVzH+ivgXq6zVEqBdifku9Q5ZuXupYk=;
 b=Ye4vJucTHPFPBZATiOXyBAp2ocUEYCMynjQGDzxdZLWtVBYhU2VbRkY4
 F5Two9VIOxKw+tboJB1iWY3wTAwyv8x/uGN4oiNoUct2qHkgp2MgQqTn/
 EWns+m2APih838qEP/cFNvCIcm+abK9Me3aLqyTJltXodi+PneZhQHKvo
 rz614+9qrISo4NxXD5j6gkFwJLpJoKEliJXP0tB+ZGZXlPq70AubafgvT
 Ew2OjNlbSGEvapAdTv7mBM83mS0uNcqSJkWAKb3m5dsk0LvRma9rzD7mb
 ehgEzb6/uWe6ohWSdRz75+Ha8r49f1q/Cp5/f3PKn9tNH+K8oxSwN5HQ4 g==;
X-CSE-ConnectionGUID: 3skR5796SzSwF4aEmUs6HA==
X-CSE-MsgGUID: fGh+/CVlT6CnpxkXG8gWrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="30960885"
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; d="scan'208,217";a="30960885"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2024 22:57:40 -0700
X-CSE-ConnectionGUID: uRN85oxdTia7MGGMJpR/NQ==
X-CSE-MsgGUID: tr5JNsd7SAiv7Uv6Yc54ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; d="scan'208,217";a="26248609"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Apr 2024 22:57:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 13 Apr 2024 22:57:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 13 Apr 2024 22:57:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 13 Apr 2024 22:57:38 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 13 Apr 2024 22:57:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3U4ufOvlvpGTG1a1oXu2LeLBfdMbQKyDw9eUjvHOOifRsmUaLKTquHGvHAbRexKACuFlnlNxJGbGqZqC0xVMay0n+CGuxCECGcX3udFKAGEcFBHmGuhE/uXVd6oPtsjLvZNg3bmojmMIeKjwHDxxS3Y5Qtw/HpYMa9+JZFqUriB/sjNajpK7CCz+YKtNpmwgpB+FSHz6M4zmdjBEdAW9PQdnq5qEYD9/gLqzxgqgOcfmIt4oEPehYG+uKd6Ka3EippfIenDatJ12N3JxkyRtAOOhUWMb0oA5/ChqaSQHUdfBYDf6jqCq66S7nrAlo4nvxyPTfbM542B8v+941Uedg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuAc/+Kno+AjxjGMpTHk0fr/jhUx8PLE/ZLNHU13D7w=;
 b=NU+/Khd87ZxOPOASiqIsIQb+dFUpsmBM+lovm5/zuEdL5VOg+CQDEox5+dEF0CaxhPML0ZT4RQctd54laL+2CoBaIZLx/HaL5bmLiZgq2apECHoJV3kgxj9ELrw8XnEO9T+Cw6PuTRTd6tzev/x1dNmRXHVNbj0kWtEk/IdDTzT5peO5DfKfMf3SQSf4WBckx1E9RPvklGNbu6/qEd2yHTBwIzP2+xlRv4x16mA0IHksK/xl196Fb6oQcpJSnHAT+A4L5qLsfJqzGhiO3UZU5rid863iP3j54sYeTLRIpCZV1PlrbhsLVwBPQVm40gmbAtsgpztLa1pkI8BXozzVEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by CH3PR11MB8381.namprd11.prod.outlook.com (2603:10b6:610:17b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Sun, 14 Apr
 2024 05:57:36 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6%4]) with mapi id 15.20.7472.027; Sun, 14 Apr 2024
 05:57:36 +0000
Content-Type: multipart/alternative;
 boundary="------------P5KL89EoPBwLzqq0Nobc63LB"
Message-ID: <c29e1ebb-c903-4852-acf7-32d966a3b92e@intel.com>
Date: Sun, 14 Apr 2024 11:27:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 3/4] lib/kms: Generalize forced_connectors[] to
 handle arbitrary attributes
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240411183450.6417-1-ville.syrjala@linux.intel.com>
 <20240411183450.6417-3-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240411183450.6417-3-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: PN2PR01CA0191.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::18) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|CH3PR11MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c409d9d-0bda-4a45-b09e-08dc5c47c914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NXazx7bPEeeJASJpRpFmQW+EPWMBxKlvWlNwpXykPKSc2PxBglHLJyPbQc+4ccLfTX33YzS3B0PoPlzbEjc/3mlYLuXJ8hrwnq2uQLvjdKt/hIAXA65DuK8Og2ZQqTf68EVyq0Y4Tq8hwnS/jFkfdGNAGoScGM5YG93pLN7/8VJmeR9PUQZqcS2enAZau6CHWM7gdotaOO30AqBA0/KrD9V08v0bMebFkFYuJU+u8ZYP+RzsV4TnaeNTv9T8K6C13MlKGqBYMsGj32XSX0qO9SSnMoUGRe/auq4Czg9CIPMjVeA3zOeHrQSZHNGjYhJggIGOG8mXWhiNG7aTu7LBzZ3wij06wwYJTFvNlemGMjZKbwQoO1VWQxaTr2uEabCJAeFoLdQaWNgZ+T1PhSyhTvJWu76q9cDXT/CwchtWmhF2ePWh42LdqCCzYJ13+wJUCBwKOTu2LJ2lOJl/bA1dLXm9ds0jH8ZekD8J090zL7QofumDYs4OaeZjNq7xcfkXa/0MeVlzM47AMZGv2ysYI1/H1UGubviSdhGZzrX7hxG/3HVXZS4AvUxwXl0q7nTldEMxsY8z5+kxKze2Y+ExMI0kcZNRd4+Zgz2O8Y6tlcgLBeMw++D9ZGi1aUWtLSNwa6WKgYBE6P+2adSrj6x+ixqKXS70krZ5XqYwSNdV9F4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NStrNEhsRlBkNWNORkhOK08xbUtMemxXd254bmRlRGM5VHpEeS9WQTM2S0hj?=
 =?utf-8?B?SWRsVW1lZTRYSGZvNHNqaXdCNXBBY2x2ZFNjbDFNTS9lWGxjQmJFOXZQTVNp?=
 =?utf-8?B?TEMvWEFQdFFuZ0VoNmpUZmx6OGozTDFvMDhUZHI0ZFM0RGh1M1BGb25HM3VZ?=
 =?utf-8?B?SDJTOFQyWFNLVkdZczhUVUxnZUtZcTkrVTlSMnJ3TitJdTYxM3AwNE1zM1Fp?=
 =?utf-8?B?K2FmdVRhZ3ZTSGxXTEU2Rml4UGFrUEw4RzZGYTMxdFl5N3V6Wmh2QjVNNjJ2?=
 =?utf-8?B?RDd6SzQ3RDBaWmh5d1BML2pCMTU0Zyt5bVJMR21RaFBrcWpyNTJjZFpicDRU?=
 =?utf-8?B?dFIvM1V4S3BvZ0RoWTZrdlRUZERXZ3d4MUFvbytObUJoRTYySU5vZTBTOSt6?=
 =?utf-8?B?OVl1dWtSVmFnem9LeSt5SmN4dHQrMDFYTHBBWkNVVGg3QmJVUXdwUHY3WVda?=
 =?utf-8?B?d0VtMTMzOXQrVmVpNGVoc3hXSjI5TXNjRlRLV1dpU2gzUFBoNUpubzlXWlJ1?=
 =?utf-8?B?NTBncHA3QmltWVFkSXgwTDlHZUg3Sk9uNnUvbVFKRnNVcXQrVi9ZMXA4TDhu?=
 =?utf-8?B?eHplWGJiN3NQUG5rZGo4eHQ0bXJHU0xqZVAyVTVQcXdRNnBUNVovQzJlME0v?=
 =?utf-8?B?ZVY3S2FobjJ3cUkyR2pHclk3ek5xYUdqWXpwOGNXZm1kaWl2QmpuU0d3VXJV?=
 =?utf-8?B?bUx1cUFKNU9STEVKd1U4WlN5SmEvRXJTL1M2QXRMN0FiOEIweWNyUTJWSmR5?=
 =?utf-8?B?a1F4djlMNmZ6eGJSSUdIU0lxa3F5dVZDSS8xZ1BlZzhXdFBUS01ZNEIxTEp5?=
 =?utf-8?B?V2k5YzI0WkNOR2hpMDJGUUlvZElycXc5RGRDTFNVMFFBLzQzTTRmSUh3c3Fx?=
 =?utf-8?B?UURzcHZ0a2duUlI0enpRQ095cWFyNzJjME5KK24yUUoxTzJiSzFsK25VQzVM?=
 =?utf-8?B?a1J4a1VHVHVTMTQ4ZXNkNFM1MUJiWnc1NkkwQlM5ckJDVDBVVEEwd2RPYm9s?=
 =?utf-8?B?M3pRM2RwWldSeXRxS0pkaWllU0NoZEhwbHhIN2RxTkswZXM3TG8xbXA1a3Bi?=
 =?utf-8?B?NlkzUW9TaFRKNkRzWHNjUDAvMzFhSEtDWGRYMUZyWCtyaGI3OU9zR1JHYmVs?=
 =?utf-8?B?SDMwMHJvdDhScXFLOFVuck56dTBvSjNHU3hrcUUzZVlLdEpnelJFN050dE9n?=
 =?utf-8?B?MmRqczAzZWRjZW1kOVMvUlhubHo5d0pNYlRJK3hrNjQ2NmQ0bkh3eDFNdlhm?=
 =?utf-8?B?OFRzMEovMngzK0lYOE82dU5tcndPVFFNNDBYWTJhMTdXY2hWOFFNajBqdnVu?=
 =?utf-8?B?aTdKZk5rb1dDNEY1NFhXb0pJbUNmMHFNYjZ4VTl4ZHJveXI1RlM0RDEwQTVE?=
 =?utf-8?B?aEtDVTIxaWdLRktXT0dsZmZZZ29wMnZkZkhRdHhEdVBoUE1Sb3NDUlA3Y09F?=
 =?utf-8?B?bVBaQ0tlRVA1bm5TWXN5UDdvT0czRXNnQXYwZEQyUVFycjNTeVZIS1RsOXBn?=
 =?utf-8?B?K3ovWmJkSlBzZlB1NVhVS3hyUmZkOXNhRnNLbnd0ODROdUg5SXlwVW5vWkJ4?=
 =?utf-8?B?SFk4MlJneXJMZmZvcXZkNzlaRFBhWjQ4VVR3ZTBIQUwyb0pYNmkrZHlZWU9S?=
 =?utf-8?B?U0pldGRCc1J6ZTRhTCtBUTZxV2RBZmVKbTYyUXo2M1c5T3FmbFREZUwzMllr?=
 =?utf-8?B?cklHZ1V2UVI0SVVYNStKT1doa3kveGRKMzljK3M3UG9PS1Q1NEVmRjVHclVy?=
 =?utf-8?B?em9GNTF2VDlrcWZVUG5ESCtzeFRwanI3bzFSRmlSWGwzcm9QT3VldW80dE84?=
 =?utf-8?B?RHFnc2lLY1lTS1Y4eUwwdEowYlNHSXZIekVDZGs0UDVwSFd3TmdUcnc4RFkw?=
 =?utf-8?B?Nm85MUMvUTRIU3ZURUJMRHl0Qm9UYldqRnJVV2ZoV1l2R1ZnYlJDdU5YTTlh?=
 =?utf-8?B?c1dDOXVyWWdtdUt3eXBqbGM0TWJCTC9ySnEzU3VIOERMQnhoQWFMU2RNQVJC?=
 =?utf-8?B?U2J6R3ZKb3MxSHVtdWdiL0krdzV2czJBT1VWZzdXQUlJUXdwTVZDQ3Q0Tjl3?=
 =?utf-8?B?MiswaXB2TzhQY0lwbkRMV0VrYVo0Z1lvWm5RNDc5bk5KTVBlQVBMQzV2ZVV0?=
 =?utf-8?B?V2RzSFhieXV6ZUd5RWhYeXpmT0hXYTFJUGJCMDlsSDV6TWNhT2hXU3FpTDJJ?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c409d9d-0bda-4a45-b09e-08dc5c47c914
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2024 05:57:36.8842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsWjPokEzoyVdjwZgHOZMM6PbmPdttMEy8TLRGDK12pWC7UoHmAz0p3ROB1cccyloTa8XEShpj1Q2qzS6DRVAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8381
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

--------------P5KL89EoPBwLzqq0Nobc63LB
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 4/12/2024 12:04 AM, Ville Syrjala wrote:
> From: Ville Syrjälä<ville.syrjala@linux.intel.com>
>
> We may want to poke at various other connector attributes
> via sysfs/debugfs. Generalize the existing the force_connectors
> mechamisn to handle arbitrary attributes.
>
> v2: Fix connector_attr_alloc()
>      Set c->value before using it
>
> Cc: Kunal Joshi<kunal1.joshi@intel.com>
> Signed-off-by: Ville Syrjälä<ville.syrjala@linux.intel.com>
LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
--------------P5KL89EoPBwLzqq0Nobc63LB
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/12/2024 12:04 AM, Ville Syrjala
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240411183450.6417-3-ville.syrjala@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">From: Ville Syrjälä <a class="moz-txt-link-rfc2396E" href="mailto:ville.syrjala@linux.intel.com">&lt;ville.syrjala@linux.intel.com&gt;</a>

We may want to poke at various other connector attributes
via sysfs/debugfs. Generalize the existing the force_connectors
mechamisn to handle arbitrary attributes.

v2: Fix connector_attr_alloc()
    Set c-&gt;value before using it

Cc: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
Signed-off-by: Ville Syrjälä <a class="moz-txt-link-rfc2396E" href="mailto:ville.syrjala@linux.intel.com">&lt;ville.syrjala@linux.intel.com&gt;</a>
</pre>
    </blockquote>
    LGTM<br>
    Reviewed-by: <span style="white-space: pre-wrap">Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a></span><span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------P5KL89EoPBwLzqq0Nobc63LB--
