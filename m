Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33CDCD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 10:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD8510FD1F;
	Wed,  3 Apr 2024 10:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mioEUhEO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3B310FD1F
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 10:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712140528; x=1743676528;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=75xbfVdXNmGOZxrFHygeJnjbz9PSYV0rWK2/MrbVjd8=;
 b=mioEUhEOOsXPJvjtR3B3IhAjcULFHQ2gjmnvtCPXS+wgW3Z/878NHpCk
 FrEMBA3SypTbWSNlLJrw9qqwEm8uWVs6PqlX/YLiNJKyI1DjSxrFlc3l7
 7xR2JLFZApvY2FX4KE8JUNroRlEzeYVO08/U177fDilzNWI5U+S3W/i9E
 lrf/gyPRl3zXgNikNBK2Pudlka3qhl41eE+/NiQlC/7maIzDNt3S2IN3z
 yPcM0OEyC60gt5L7YapAbr+mDShUez4wVDqmZE9sQf9egbBzu5ixx5HU/
 xajxLAplA6MRStgf+lnZ8qFu6RNo9KrubbcH8eo6Lxl4lTpkgfyrUGzGc Q==;
X-CSE-ConnectionGUID: l6RPiKCAT/CHZt+ZUdfjdg==
X-CSE-MsgGUID: XhmAOxX0ScCUFt8pXwfUrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="24861683"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="24861683"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 03:35:28 -0700
X-CSE-ConnectionGUID: gvH47M0xRhGPzBOz36anfg==
X-CSE-MsgGUID: bKd9feIrSIWG3f+I5TPG6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="49628086"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 03:35:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 03:35:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 03:35:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 03:35:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 03:35:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2KueT06iDnGskc5IkW6/ETTxEd/E5wJDv/agEr/7XGOV/bmhgVnxvcFGcngt4diTYUNo4Jew9iS5fRylZx0IQolP5VpRnfOylTtX+YXX4sdC/vd+Pj6mUZnT0xWkPN4D0yeZhpoEIyJW0jhR1kDX2ufpYdHuQAqetvIvWSv8ps8SNJHItL9s9pumbywjO/vymHqS38FdM0Ln+H2tz8LeSUQLRLQwbdebnYiXuRlVqIQ5oryU8y7GMRhVw0PyMqxmyp+hhUO2mXGruedBaBt+lgFjDE0W6XigYvOTNer+1cb8BEkVjZ6fGvKdaas1LWtkf2LzYM0Mk5IQzeh4Se8WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75xbfVdXNmGOZxrFHygeJnjbz9PSYV0rWK2/MrbVjd8=;
 b=m4dIVBnXs3c75Io02KirHbQ+8/b3un+qI1XxlshtIyoFtXwjkDdCNIPCRLrAYZlw3kl50igBUYQZBp2MAArOawDATkf+9tAFRcW+3Ie0/GdxALaIJuRUX1659PqOSfLdiMdp8FGkU/Vm869ZZuJSf1fPjdWkiA9yeP3CYe6M8Z45zSRultb7vkTSDRB9qUmUuUrWHIPUHXWmzAoQ07MySy2ifS+xrCU9TkTl0gHbbVAqBszhUbHI3qLFDGkQCkfaKP1XJbX+THfOddf7IX6rZdfQB2nVLyrVwPPdrTAMzULH04lQ42dLpfODmcUShqOYAWyMmIXC65JbjmxDwoJoCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by MW4PR11MB6713.namprd11.prod.outlook.com (2603:10b6:303:1e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 10:35:25 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 10:35:25 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] lib/igt_kms: adapt to boolean debugfs for
 i915_bigjoiner_force_enable
Thread-Topic: [PATCH i-g-t] lib/igt_kms: adapt to boolean debugfs for
 i915_bigjoiner_force_enable
Thread-Index: AQHahL8OycRl+ILqiUOBsafPrxy3QLFWQ2GAgAAYPWA=
Date: Wed, 3 Apr 2024 10:35:25 +0000
Message-ID: <CY8PR11MB68896BC4B21868A36125BFCCDA3D2@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20240402054231.1499492-1-kunal1.joshi@intel.com>
 <60164b97-fc59-4d31-9572-045c2138662a@intel.com>
In-Reply-To: <60164b97-fc59-4d31-9572-045c2138662a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|MW4PR11MB6713:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: caCelxUBPA1vj3fFdDDXI77XwHb1215sXSespDOQHFNUgk9hHew17r4B3U7GYCL8io0Mzy+jQMUuXVtc02zHLMZI1WL1oWsPqKFqvyw/OKe+CTvo1QTJrChxrOe56Q5kFpE5q7yAGaxHdqGAjFw7/gd2yu/md5GcL/X6RuzznRqgW0ym9TySkFPh8moM3D0Icjy3WHCOTPJ8u6O/4PjnPN+V9eNEJcFZGqCCvkuCuV5U3BwHMGj1ZnPBsGuKhM5wwecTpQJ2Cd9LdNZs8jmCVuKmgcHftsQVHjf2CVFM+uuIC0jRttccJG4yFsRDhQRDo6VL0SkLN7PAAbnKl1G3oC/CjLqFc0NGgLKbzv9xkDhHl0FnjswTzlTnqwQvE7TIRw2faTpJgzXNAiAci1qEy/K2lLVym7U5rVEhuGn6VYNBchCaEFy93rsniyixVhxpGvaSwc8VqZpq3AN12/A5Li7tUN/D8bv+FTVvuTWNc0boE7tTDLDyIyy5KJbB/+N/in3I4AWZUQ7kmAIOFPnckafFRrODagS4jc5jN9GLgONe0f0dBjp1UWYJfkt5DWPsNjUvMMkbRAJuYK/MVEQZHAg1z1mntmmGuk4puvCveDp0/JfJWoH790isJDlpr/KmfF5BYA/qbgd6btTpxpk0Qd5MzesVQ0ThDNk0qAyL294=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NS9EMTRleFBSNzZGU0RrL0Q4UjlIUmdpaGNKdVplL0xnV0U0RnVhRVFYeGFn?=
 =?utf-8?B?UnlPT2c1SEJYcEY1OEI5d2s4ZUxNSlhRRlZPcjZiWlpWcURKVzRsUkNRMDhU?=
 =?utf-8?B?MFpDYXNaWXhFSHN5d1pQaFEvaXJYeGhFd0l5S0xyS2xBSnZ4a0pIWkNLdDNE?=
 =?utf-8?B?L2NXMW1pV2tOcjhkYUVlMjhrNWlqZHQwR2d6SHk2cjdjQ3krajZCdDJvZ1FW?=
 =?utf-8?B?UGJFV3hiMVdqK2h3cG8wT1lLRWcyNE1TUXpUQkl0bDEzS0NKZk9nY00wNFcy?=
 =?utf-8?B?cmpOVDVOakx0U1J3U04xSXpIQzVxaWdsMGpnNmx6RHd1Q09XejloTHlHRit1?=
 =?utf-8?B?SFhTSVdkVGZqK0swZC9TS3MyUGJDcXdqTTgrVW1rQlFUbStjSnViUGVHdEhP?=
 =?utf-8?B?TWQwRXZLZXVJNkRSTGQvZmNrLzRJdFQ4MTdlMGVpL2FEMjFQUHJuOGNyVGpK?=
 =?utf-8?B?bkFnbVVhQ2xLUXN4d2VaeWVEd0l0UU54bUdmUTFOL25DQnZuOWtFZ2FBeHhs?=
 =?utf-8?B?Q1grOTFNblIwQTJMYzlSSklsS2lLSzMyREFXRkdUUVE4VVJ1aThsUnN5ZUZv?=
 =?utf-8?B?eFppeXpLZlMzYWVZY1JUS2VZMlNsL0xkY0VySkt0VFFhYVVnL0dvc1Y0ZWQ3?=
 =?utf-8?B?OFFOdE1ad2lRSVpHT2pvN2dzU1luWHBUaWlzVnk1MmRxLzlFUzdzYzJVYjBZ?=
 =?utf-8?B?cEN5RUdCQzY5aElrWHZQNWYweFYxWWRwbHBVZ1JBdTN0MEVrTXk1bG4zSzBG?=
 =?utf-8?B?aU5wd21ickY5b3V0ZEZxTmRUeXNack1sZTlrTU1Nb0dBVVloRXVJTXVQK2k5?=
 =?utf-8?B?NVF5ZEpvdkQzODg4MHloWnVTTWFsTGRJbGw1ZE90ZTcwemNKa2dvdk9LSVZS?=
 =?utf-8?B?RXNFejlGRFJnN1c3eHBzUjh1SGhuelpTRytyZnpTZ2dmMGI5V2JSdWdLT2pF?=
 =?utf-8?B?K2lsZkRJc1VXYW5kNmY2cEtRQmRmdGE3SkpJaXZpWm5JVURQR2h2TGk4cWIx?=
 =?utf-8?B?N3BYNlljR1oxMjQwSHBra0lhTFM1RkEwVEtYU0FkTlFmcVNFejVTSHNvOXVG?=
 =?utf-8?B?ZlpoeXdEZ0M4NW5iNDlLVVpwZENhaDRwcUpXT0pqRXNsN3ViYUZuaCtpQzJU?=
 =?utf-8?B?d1pyeVRWbjZ3RDRSaWNUeXZrdFNLMVNRL0Q3ZUtxRzE0Z1dwazJjbURORjBB?=
 =?utf-8?B?MCtQNFo1emlZQlVuUTFwM0NwVnpRUno4VE0wUUV0N1NRT3JBTjNuLzJySUpQ?=
 =?utf-8?B?cUttcVV5eDhwV25IaXk1ajVqUk5XODRkbjBZVlFIdTFIdkZORmt1UkUwNTdz?=
 =?utf-8?B?N1dPNHM3UXd0VEFoY01zTVBPdkdTZytTa2UrbE4rUjE0T2tKQ3JjWmRNM29O?=
 =?utf-8?B?bWNQQzgyRmgyaC9vR1ZsWllwaW5ubkE4VXVheUcwY0t3Ujk4a3NsQUxGVzhR?=
 =?utf-8?B?eHBIbENXb0FkaDZOb3QwNEtGR21rc01kYTBtQTliNHA0b1c4RWRtbmxqMjZN?=
 =?utf-8?B?cW05c0llN0dmUFMwUHVFUWNkQ3VpcElIN3h3eDdoTXg0YlV2NnhJcGtBNElH?=
 =?utf-8?B?Y0drNDRhUjkvQ2ZyUUFQTThicWZtS0dFVlB1czkwZy9aZTlzalZtN2JjQVM0?=
 =?utf-8?B?NExUWFVyMXczSG5IQ0tZeVRjQ2NIb0pBbmRDTUs2TE9JZTRzaXl0ZkRMMThL?=
 =?utf-8?B?Y01qbmJueFNrbTYyNjdrcDhZRGJabWhXNjV5djE4MkZMUHAvUXV4cVlrNjk3?=
 =?utf-8?B?R1J2ejRtQ1psTUJkQTR1eGpIcjFsU0gxU0FPeXY3NnhzOTNpTktqZys5YmdG?=
 =?utf-8?B?ZWhPTWFBdmhlUTFwNzYzVThoeGRLRzdlZnlROFJjSmlKOVkzTkh1NTNkb0FQ?=
 =?utf-8?B?dUQvdU1hUkZCV3A5NGpEZHZOWDNIemZLT0RnY2JPTVkzQndhMmxmV1N2bXhj?=
 =?utf-8?B?VVdqWHFDbHhYSzFKZEhoZDEwMnZSOWxZVWRHRjFMWkY2d0U1U2IxUkxzYzha?=
 =?utf-8?B?NXBrYVJFVkJtZnJzUXdubUhvQjFLUGl2aHZEeDhIeGlNa0lnL0tmUFFRbG1C?=
 =?utf-8?B?RTNmcFd4cnZFNmFNQnlmTm1KZHI1UGRvcmR6dmhuL0dVZVErR0g1ZElsWjIw?=
 =?utf-8?Q?c7dRmXhu3WziGvUfItlNdzMUH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 252fc823-76ce-40bd-ff23-08dc53c9c609
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 10:35:25.5828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5m76wCpw/hpkatjaNEYE4/2Mqxj3ImGv9yuJ43uSMUuYEHKYfbrj/vYmowuvudCk03WPv2MicCWTWWGfLfAJAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6713
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

VGhhbmtzIGFua2l0IGZvciByZXZpZXdpbmcg8J+Yig0K
