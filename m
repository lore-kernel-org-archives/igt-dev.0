Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C8089B38
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2020 11:46:14 +0000 (UTC)
Date: Tue, 6 Oct 2020 14:46:08 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201006114608.GD7444@platvala-desk.ger.corp.intel.com>
References: <20200930115307.1447-1-petri.latvala@intel.com>
 <46b26750-b0fa-0878-0583-83ea647b1be3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46b26750-b0fa-0878-0583-83ea647b1be3@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib/igt_chamelium: Use curl timeout
 for xmlrpc calls
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Oct 05, 2020 at 10:53:21PM +0300, Juha-Pekka Heikkila wrote:
> Patch look ok to me. I suspect there may be revealed chamelium related
> issues by this but they probably can be 'fixed' by increasing timeouts if
> there show some complex timing problems.
> 
> Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Thanks, merged. And ready to increase timeouts if weirdness ensues.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
