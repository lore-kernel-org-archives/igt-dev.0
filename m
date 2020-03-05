Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AAB6E313
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2020 13:39:26 +0000 (UTC)
From: "Ramotowski, Maciej" <maciej.ramotowski@intel.com>
Date: Thu, 5 Mar 2020 13:39:22 +0000
Message-ID: <02518fd40a2748e08516f9a6790685ec@intel.com>
References: <20200305105520.313-1-maciej.ramotowski@intel.com>
 <20200305121041.GT3839@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20200305121041.GT3839@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] .gitlab-ci: Reduce Docker images size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Yes I did use git send-email I did pre-check with --dry-run option it shows 8bit for encoding. Should I try to resend it?

-----Original Message-----
From: Latvala, Petri 
Sent: Thursday, March 5, 2020 1:11 PM
To: Ramotowski, Maciej <maciej.ramotowski@intel.com>
Cc: igt-dev@lists.freedesktop.org; Hiler, Arkadiusz <arkadiusz.hiler@intel.com>
Subject: Re: [PATCH] .gitlab-ci: Reduce Docker images size

In your mail header:
Content-Transfer-Encoding: base64


That's why it doesn't apply in CI, and git am here too cannot cope with the encoding. Did you use git send-email to send the patch? If not, please do.


--
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
