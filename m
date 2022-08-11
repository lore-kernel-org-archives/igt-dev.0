Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B492A7E54
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Aug 2022 09:16:06 +0000 (UTC)
Date: Thu, 11 Aug 2022 12:14:54 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>
Message-ID: <YvTIjlCyxzJft4PF@platvala-desk.ger.corp.intel.com>
References: <20220810135530.992455-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810135530.992455-1-ryszard.knop@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/3] Use Jansson instead of json-c in
 igt_runner
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 10, 2022 at 03:55:27PM +0200, Ryszard Knop wrote:
> The json-c library has a hard limit of 2GB of its output. While normally
> it's not a problem, some very verbose edge cases make the results.json
> output go past that limit.
> 
> This series converts igt_runner's json-c usage to Jansson.
> 
> 

I haven't been able to review this thoroughly yet, but an initial
comment can be made:

Absolute blockers for this series are having gitlab CI correctly set
up so it builds there (should be just a matter of adding the packages
to the dockerfiles), and having the required libs installed in our
CI. Latter we're able to see fully done by having a successful
premerge on this series.


-- 
Petri Latvala
