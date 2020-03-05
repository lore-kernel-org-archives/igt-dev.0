Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6486E0BF
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2020 13:43:52 +0000 (UTC)
Date: Thu, 5 Mar 2020 15:43:49 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200305134349.GU3839@platvala-desk.ger.corp.intel.com>
References: <20200305105520.313-1-maciej.ramotowski@intel.com>
 <20200305121041.GT3839@platvala-desk.ger.corp.intel.com>
 <02518fd40a2748e08516f9a6790685ec@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02518fd40a2748e08516f9a6790685ec@intel.com>
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

On Thu, Mar 05, 2020 at 03:39:22PM +0200, Ramotowski, Maciej wrote:
> Yes I did use git send-email I did pre-check with --dry-run option it shows 8bit for encoding. Should I try to resend it?

Please do, but recreate the patch after

 git config --local format.subjectPrefix "PATCH i-g-t"

and send test mails to intel-gfx-trybot@lists.freedesktop.org


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
