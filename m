Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868226E52C
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jun 2021 08:19:02 +0000 (UTC)
Date: Thu, 10 Jun 2021 11:20:43 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YMHLW1PoKhmTI6A0@platvala-desk.ger.corp.intel.com>
References: <20210609121733.16461-1-venkata.sai.patnana@intel.com>
 <20210609121733.16461-8-venkata.sai.patnana@intel.com>
 <YMHIbueC7XfjOdnc@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMHIbueC7XfjOdnc@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 08/11] tests/kms_addfb_basic: Add
 invalid buffer object test for discrete
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
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org, Mohammed Khajapasha <mohammed.khajapasha@intel.com>, Latvala@platvala-desk.ger.corp.intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 11:08:14AM +0300, Petri Latvala wrote:
> On Wed, Jun 09, 2021 at 05:47:30PM +0530, venkata.sai.patnana@intel.com wrote:
> > From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
> > 
> > Add invalid buffer object test case for discrete, to validate
> > IOCTL_MODE_ADDFB2 ioctl for LMEM, the framebuffer backing
> > gem objects should be from local memory for discrete.
> > 
> > Cc: Latvala, Petri <petri.latvala@intel.com>
> > Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>


Oh and change "Latvala, Petri" to "Petri Latvala". The comma confuses
git.


--
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
