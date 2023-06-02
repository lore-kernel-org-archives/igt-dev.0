Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F3C10E1F5
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jun 2023 08:24:13 +0000 (UTC)
Date: Fri, 2 Jun 2023 10:24:08 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
Message-ID: <20230602082408.jlzue566wmbbkzd6@zkempczy-mobl2>
References: <20230530100805.7404-1-sai.gowtham.ch@intel.com>
 <20230530100805.7404-2-sai.gowtham.ch@intel.com>
 <20230601051147.fliaehg53iiumrd3@kamilkon-desk1>
 <MW3PR11MB474860B8EAA3CA284CC80B5BAE499@MW3PR11MB4748.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW3PR11MB474860B8EAA3CA284CC80B5BAE499@MW3PR11MB4748.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/xe/xe_spin: Integrate
 igt_spin_new with Xe.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch,
 Sai Gowtham" <sai.gowtham.ch@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jun 01, 2023 at 07:59:49AM +0000, Kumar, Janga Rahul wrote:

<cut>

> > >  typedef struct igt_spin {
> > > @@ -83,6 +85,14 @@ typedef struct igt_spin {  #define SPIN_CLFLUSH (1
> > > << 0)
> > >
> > >  	struct igt_spin_factory opts;
> > > +
> > > +	struct xe_spin *xe_spin;
> > > +	size_t bo_size;
> > > +	uint64_t address;
> > > +	unsigned int engine;
> > > +	uint32_t vm;
> vm defined inside spin_factory as well, can we avoid this if it is redundant

I think it can be useful to assign external vm or create a new one in it.
Then on free path you're destroying only vm you own.

--
Zbigniew
> 
> Thanks,
> Rahul
> 
> > > +	uint32_t syncobj;
