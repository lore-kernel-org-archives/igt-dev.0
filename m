Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB8DC67861
	for <igt-dev@archiver.kernel.org>; Tue,  9 Apr 2024 08:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C7A11244D;
	Tue,  9 Apr 2024 08:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TpbaBzYD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F4A11244D
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2024 08:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712650433; x=1744186433;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PhJBJlcLnYq1QGQ/cWQMmlrX/0hiSCsAPjpWxeTgnk0=;
 b=TpbaBzYDo92+YjLwn/5vaGcncc3/Rd7SskbNo0yVrZtgFctscQNOxRoj
 rpz0u09wQYhOAKgkjBK2muUUUXHzJ1UQ4PJHH6mA8g79hgMkWsUA/rZpK
 5SNRpMoY1yXGeVI4L4AWcWyoRb/z9PkmSib3VpAdhslRalJhi6S/970sS
 WbIywaN1oBU+tC6TFo1J/I2LdnL70gga0YkdeFa6OdOsxY555gOe83q25
 NCwzU+gnleUW3r4DI8b+zkSqBxt3cFfbPAXeUn9wADCjLZVF87Nq0PY2T
 OobB/EOqKY/64qGsyvz1lhc1/NDWIwWzZQS0g0nxSKRmsfg9/fwpzWVdy A==;
X-CSE-ConnectionGUID: d+23aFlJRMKxjF61P2vCZA==
X-CSE-MsgGUID: FpSxq9IERPmAY7gNi2/Zgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="30446793"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="30446793"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 01:13:49 -0700
X-CSE-ConnectionGUID: 8CArOeuMRD6ihqHRaUgfTw==
X-CSE-MsgGUID: ePfd2qulQ2emTtbIgTDfIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="24887413"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 01:13:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 01:13:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 01:13:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 01:13:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbQjanm2N8xLiZUMrHRLaqswppXWklF6X6wQftNVgXfzoytt7+kjFbuo4NMRbcTWxMogEdsTpf8y3Ko1wPRdS4v42TrIKZxcTcp+yerIzrXk/aYgZqjMYSKP00swFxxRK706nL+a9XamULQh8aw/+zv6mUVOaZmn8DNlc2kjGx2K3PteTC7+HM53ShV6NbKpjIzLzekcd7AG11d50Vyte2aqEZY1qi2DHmtRIKxa5GXTl8Ny3RyHZTk7Ag2Jos5gyz838HujvEW6zOeWynM69nmlmmEEg7e+ivJPQXlGVIlqSXqMA8n6g0wT1p1bQE6LiZVE3EFWy0hsi1Wzbtz3Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8vU18KfhA/WZGYKeeUGQXTMQ2T9CQ8RFfKC/NBwfKY=;
 b=QMVmAznQsP1dbTBM+33Ty4vFdjm7o9TMIBTMOO7J1NAphrEfMjGsDl3D7FA/HLXOGPhqPuAA0T133ERloe0BtHFQsSFf7m5KYyVEfZMdjqIcAGOnUyeYlg6mz3nc8xNIdgIjxI8tQD9Ex3EZmNP9FO3jlGhRLGlqy8xbXVM8ynBCuz7mV3XxGoJywfbQV4RdTWGe0UiuvrnW0laRT1Wz7f+6O3wg4nqslNPesPPqYYRtUJrHjA8H0yghg0CsbYTDjoJ0Cx/tL+MDl32QlzA/H6xlpdKoECI+V2xYY1k4XSBpe3LnMMeUaErwo+uC86eJCExhe8lSenKSrvGFlgvxuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by PH0PR11MB4968.namprd11.prod.outlook.com (2603:10b6:510:39::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.10; Tue, 9 Apr
 2024 08:13:40 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 08:13:39 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] scripts/doc-tests-cross-check: allow whitespace in
 keywords
Thread-Topic: [PATCH i-g-t] scripts/doc-tests-cross-check: allow whitespace in
 keywords
Thread-Index: AQHahrdr1Tu0BgOB60eec1TvOsW76rFfmElw
Date: Tue, 9 Apr 2024 08:13:39 +0000
Message-ID: <IA1PR11MB609779B37062CE18327F863786072@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240404174152.107265-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240404174152.107265-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|PH0PR11MB4968:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GQaSnVWf2/IKbJtphmcEpWoeK7OAJUHjvwYl1TR150SoAyiv7x9obw7I/kPgddJTBhuc4qqLC2wGkQxZPXwJM53BfkUgXOynCkw3BE2fGu8hFHj37xI48WRnXhCSn1wedlqhR+NE77jDVlkQOlzqL2D0C/+m981nn9W4h2avU+IVRzHOaFoIgIePxYr+hCSLDn9Ta9rGkZlyr+LMHuhGiCEo/s5hZUzYMh8QyGYQDvzYmixFH5/K7+xewrGG+nRr8/goTUlh5Me0FJiaK3ASKBBiEqAQPz3ZkJJDvOGVgwradHrdypay/a7lPcJDoOPWlMyzVo0Gu801wddnv5dICtr8S9sdshBvlUltowaztMeoiP7zcL7bqMRVa2XRxendSKL4ht999dmr9XotQCzeU+zHJbdusJxrk95WCGbbGIUxqLwIrg+MwH3SzVrI52Mp0RVz51STjuRpE2HFi9h0ajWvwCsj8wURJTXHEQx6+HsN+Ze03D96Ybw36rkbwPPi23mcs1S+yYKGurLPKw2sXp+3FR5Hf4gve+TyTyxA/bDPPuI1nbdINk2I84JW0KSH3tHrTco8FDCgozLOUq2+Qnfby/5hRmRz2mBVsz+D0QO3eSIBSYZ6bV633Ywz/ZwJ9kLeIGFZPwXsDLm+wVCaUbP360aC1YRmqAvziL8pg0E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MaCAFCAkPwusA59Zed+FFm1TA26KchvCWD43go7lLjiJZPXYo5/nB+saTCrF?=
 =?us-ascii?Q?TQMR3/Gdq6TA9toURBwC0NSjoaVs/r+Fij816im6S+41JUKZE+Cgl7uMwVnx?=
 =?us-ascii?Q?mZODRDySbDr/EUH92v541FbW0IPjxMF6NbYPz5AsW86YWvcFFz5tlmFVxuxt?=
 =?us-ascii?Q?A4mHUv1gZmoIobNNHduNDGF66EnZxpL5UnbewU7rzsf9l8NAOXfr/YbInH+D?=
 =?us-ascii?Q?sY+ypYclfLgj6B2P03A07yFJ/Pl4VAkZRcToLKMUI/xdpbk+3GCSqcjnGGfu?=
 =?us-ascii?Q?JTLGwp/L2eHEqpTK4NoZSodOy7eSzCOFfXlUWfUjhieN8YZMePwKzSKxmxCP?=
 =?us-ascii?Q?GnEu9ZzDHlMFwqVhtr/HY8n60irzzJEKtzTvVfNrXih7hT0uMRgE9/DtnGoX?=
 =?us-ascii?Q?lyg/mMb/5TfDMF51yvSIAGfGa61K3zWOz7rOt9wMpFbnHdq4FRyg2I/pNmfJ?=
 =?us-ascii?Q?OwuQG7S0iOYNQ8w1dOunzssbFM+PKPkb68IQTIcS2sBTgWa7JtHG8exNv2J0?=
 =?us-ascii?Q?ZmYQv7fLohJpk/qhJrIJkYoPtAfBmrufmdMBIlb7Xxaro0/+nsITxTOmc2n3?=
 =?us-ascii?Q?PrYKJ0D+0MdvcNcYoTzveYPsNf3PB17Sl9eKU3kkqo3srB52yz0Dmcvy/ok4?=
 =?us-ascii?Q?u1FkPjMJUiWdmQNk5xZhkrgdBYUDdktalmf8I2KTuqh8r9NJZPWOY/KqP078?=
 =?us-ascii?Q?4EPj9SXHqsub/MeQM2mJTGsNOVcTJ0k+h5Pm0SCbp3JqCMYl/HlP9PBz9N0R?=
 =?us-ascii?Q?qB0Ay+qZV+ITa2f6fJiZeJyxwq32vMykMj0IrUOiXRNR7OsSC+8/K2Sw/96J?=
 =?us-ascii?Q?QkN9zmgKYVz6IaIMNEAn9jvvFlcPDD2flKi/T9Lju6LEr4fidun+yiXx74bQ?=
 =?us-ascii?Q?Hj4AsCSeY3bWWGaIC2AFUpjQun3DPTX8JgIjrvuB53uJ2YN0LZOcinVl0y3P?=
 =?us-ascii?Q?yiWpqX2TH76z/FWsniC5j/jWG5798DGxTv7s4uUOislPkxU7RXGLYatcF4Cu?=
 =?us-ascii?Q?5Q8mu+wugjOQqbrRDn8jxSR8J/2BTJebOkybocxoHhrOgrSD0xg1uaz6okrS?=
 =?us-ascii?Q?J3/lm1MF1SQPP5SIsiSuExtR5gNooXWwmdrZ9qPK9khLVMYKDi8t5n4xsH+u?=
 =?us-ascii?Q?MgmyFWD5jB1jRFQ2GklD4T4KrH8RlufBw0m54MHYQI9kqdnn8kg/SvzCAKkd?=
 =?us-ascii?Q?TXiVWnSunJnzpMyXpx3a91yZEnMN/YSM4d78fzQhOk3o685SeGJn27xNSJTq?=
 =?us-ascii?Q?AFKVkupW/UZht4rc9GgdRjF2WzB9msLYaFY9S/4jnLBrwdWeJGLvQySwpxF3?=
 =?us-ascii?Q?JJmlP4foKz4/t5duPDs4aeHvgp4PaUkn5WBxQyb5IjFfl9XL1vT1mZnVvz+v?=
 =?us-ascii?Q?7gyHOLdjLNYX2/fR0QKVG6xNq667tOaFhmLDNxs6Da8mJFILaInrGh3q/BXl?=
 =?us-ascii?Q?LQcWRr0zIqBHy2VJnr8YcfaBp/UwqjpFQ80P1Z0t4Sk5MzknFIKzaewdNIBX?=
 =?us-ascii?Q?cE/73jOzLbrMF151h2YcEKBXai3t48hQhKA0GhGVCCEGm38Pahvk/s8/iX20?=
 =?us-ascii?Q?968smLk7n4BjGq6YncjsiEGdD0+FBKjC88s+jjiu4aTrchznDa81vPuDK4mA?=
 =?us-ascii?Q?g9tbZxZojNhjlj5R33xb9NR/vC9gDIwdjdwwBxd6wVjkQMwwk36VCFJ1TX08?=
 =?us-ascii?Q?lNW7Iw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a67a053-131a-4827-e0dc-08dc586cf674
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2024 08:13:39.3820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p6iwGxRzqtDcf2qNqNoBJBLCUZtfB2tEwsEhK134Ogk6/gbiMvgeM3JcnMfOeraK0n38COpv5FTMEqjzRdoxGvoYusYcyP2E+RfEY+blpPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4968
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

I used the tool and it is working as expected.
Reviewed-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>

Kasia

-----Original Message-----
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>=20
Sent: Thursday, April 4, 2024 7:42 PM
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Piecielska, Katarzyn=
a <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t] scripts/doc-tests-cross-check: allow whitespace in k=
eywords

When main field name had whitespace, script incorrectly split it into two s=
eparate words, for example when used with "Mega feature" it treats it as tw=
o words: "Mega" and "feature".
This is not what we want it so fix it, also use "Mega feature"
in main call.

Also while at this, add additional verification step that conflicting words=
 are consistent and improve example of usage.

Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 scripts/doc-tests-cross-check.sh | 33 ++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/scripts/doc-tests-cross-check.sh b/scripts/doc-tests-cross-che=
ck.sh
index 174b14807..3f1dc7a83 100755
--- a/scripts/doc-tests-cross-check.sh
+++ b/scripts/doc-tests-cross-check.sh
@@ -34,10 +34,10 @@ grep_test ()
 	myout=3D$2
=20
 	echo "running: $myout file: $test"
-	grep $myout: $test | sed -e "s/...$2: //" \
+	grep -E $myout: $test | sed -e "s/...$2: //" \
 		| tr '[:upper:]' '[:lower:]' | sed -e 's/, /\n/g' \
 		| sed -e 's/ /Y/g' >> b.$myout
-	grep -r $myout: ../tests/* >> n.$myout
+	grep -E -r $myout: ../tests/* >> n.$myout
 }
=20
=20
@@ -61,8 +61,12 @@ scan_dirs ()
 {
 	rm a.columns
=20
-	for todo in $@; do
-		echo $todo >> a.columns
+        for todo in "$@"; do
+                echo "$todo" | sed -e 's/ /./g' >> a.columns
+	done
+
+	SCANWORDS=3D`cat a.columns`
+	for todo in $SCANWORDS; do
 		echo "Scanning name: $todo"
 		one_scan_dir $todo
 	done
@@ -89,7 +93,20 @@ check_test ()
 		grep -i -w "$test" w.$1 >> .tmp_check
 	done
=20
-	sort -u < .tmp_check > e.$1
+	sort -u < .tmp_check > .tmp_ck2
+
+	# it is a match only when is a column in our original c.$1
+	# as a word could be shorter and grep will match it then
+	rm .tmp_ck3
+	CKWORDS=3D`cat .tmp_ck2`
+	for test in $CKWORDS; do
+		grep -E -i -w "$test" c.$1
+		if [ $? -eq 0 ]; then
+			echo $test >> .tmp_ck3
+		fi
+	done
+
+	sort -u < .tmp_ck3 > e.$1
 }
=20
 # will use .tmpcols and create w.$1
@@ -134,7 +151,7 @@ echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D"
=20
 # Mega feature / Category / Sub-category / Functionality  # Mega-feature i=
s not used now -scan_dirs Category Sub-category Functionality
+scan_dirs Category Sub-category Functionality "Mega feature"
=20
 echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
 echo "checking..."
@@ -153,8 +170,8 @@ wc -l e.[A-Za-z]*
 echo ""
 echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
 echo "example useage: take a word from e.* file and grep it in c*"
-echo "grep -i word c.*"
+echo "grep -E -i word c.*"
 echo "to see where it is used in tests, use:"
-echo "grep -i word n.*"
+echo "grep -E -i ':.*word' n.*"
 echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
=20
--
2.42.0

