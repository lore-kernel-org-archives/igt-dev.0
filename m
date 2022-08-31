Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680C810E2A4
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Aug 2022 09:30:56 +0000 (UTC)
Date: Wed, 31 Aug 2022 12:30:01 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>
Message-ID: <Yw8qGVZXw6DqwJYz@platvala-desk.ger.corp.intel.com>
References: <20220808161825.1942387-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808161825.1942387-1-ryszard.knop@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/7] Add the --environment flag
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

On Mon, Aug 08, 2022 at 06:18:19PM +0200, Ryszard Knop wrote:
> It sets the provided KEY=VALUE pair as the environment variable for
> executed test processes. If just the KEY is provided, the currently-set
> value is reused (and the run fails if it's not set for the runner).
> 
> The most important thing about this feature is that all the variables
> set this way are saved for resumed runs as well. This lets developers
> easily try something out from the terminal without having to remember
> to set the same vars/reuse a wrapper to continue a run.

Series is

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

However, patchwork looks confused about this series, the individual
patches are there but they didn't create a series so no premerge
testing has been done for this. Can you resend for a peace of mind?


-- 
Petri Latvala
