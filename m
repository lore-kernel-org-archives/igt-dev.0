Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7B06E2E1
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2020 12:10:44 +0000 (UTC)
Date: Thu, 5 Mar 2020 14:10:41 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200305121041.GT3839@platvala-desk.ger.corp.intel.com>
References: <20200305105520.313-1-maciej.ramotowski@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305105520.313-1-maciej.ramotowski@intel.com>
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
To: "Ramotowski, Maciej" <maciej.ramotowski@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In your mail header:
Content-Transfer-Encoding: base64


That's why it doesn't apply in CI, and git am here too cannot cope
with the encoding. Did you use git send-email to send the patch? If
not, please do.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
